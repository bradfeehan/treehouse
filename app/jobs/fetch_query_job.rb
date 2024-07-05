# typed: strict
# frozen_string_literal: true

# Fetches a specific query from the corresponding API
class FetchQueryJob < ApplicationJob
  extend T::Sig
  include GoodJob::ActiveJobExtensions::Concurrency

  good_job_control_concurrency_with(
    key: lambda do
      T.bind(self, FetchQueryJob)
      [
        self.class.name,
        queue_name,
        arguments.last&.fetch(:query)&.id,
      ].join('-')
    end,

    # Maximum number of unfinished jobs to allow with the concurrency key
    # Can be an Integer or Lambda/Proc that is invoked in the context of the job
    total_limit: 1,

    # Maximum number of jobs with the concurrency key to be enqueued within
    # the time period, looking backwards from the current time. Must be an array
    # with two elements: the number of jobs and the time period.
    enqueue_throttle: [1, 15.minutes],
  )

  queue_as do
    case arguments.last&.fetch(:query)&.queryable
    when Queries::DomainQuery then :api_domain
    when Queries::RealEstateQuery then :api_realestate
    when Queries::OverpassQuery then :api_overpass
    else :default
    end
  end

  sig { params(query: Query).void }
  def perform(query:)
    log(query)
    return if recently_fetched? query

    response = query.build_response
    return if response.nil?

    first_page = response.fetch!
    Rails.logger.info { "Got response: #{first_page.inspect}" }

    first_page&.save!
    return unless first_page&.next_page?

    Rails.logger.info { 'Enqueueing another job to fetch the page after' }
    FetchNextPageJob.perform_later(page: first_page)
  end

  private

  sig { params(query: Query).void }
  def log(query)
    Rails.logger.info { "Fetching query: #{query.inspect}" }
    Rails.logger.info { "Queryable: #{query.try(:queryable)&.inspect}" }
  end

  sig { params(query: Query).returns(T::Boolean) }
  def recently_fetched?(query)
    last_fetched_at = query.last_response&.created_at

    return false if last_fetched_at.nil?

    # Bail if last response is fresh (within the last 15mins)
    if last_fetched_at >= 15.minutes.ago
      Rails.logger.info { "Last response is fresh (#{query.last_response&.created_at}), skipping" }
      return true
    end

    false
  end
end
