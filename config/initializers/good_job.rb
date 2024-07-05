# typed: strict
# frozen_string_literal: true

Rails.application.configure do
  # A pool is configured with the following syntax <participating_queues>:<thread_count>:
  #
  #   <participating_queues>: either queue1,queue2 (only those queues),
  #                                 +queue1,queue2 (only those queues, and processed in order),
  #                                 * (all), or
  #                                 -queue1,queue2 (all except those queues).
  #   <thread_count>: a count overriding for this specific pool the global max-threads.
  #
  # Pool configurations are separated with a semicolon (;) in the queues configuration
  config.good_job.queues = %w[
    serial:1
    api_domain:1
    api_realestate:1
    api_overpass:1
    -serial,api_domain,api_realestate,api_overpass:2
  ].join(';')
end
