# typed: strict
# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
# require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require 'action_view/railtie'
require 'action_cable/engine'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Treehouse
  # Main Rails application configuration
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.active_job.queue_adapter = :good_job
    config.active_record.schema_format = :sql

    # GoodJob `execution_mode` specifies how and where jobs should be executed.
    # `:external` causes the adapter to enqueue jobs, but not execute them.
    # When using this option (the default for production environments),
    # you’ll need to use the command-line tool to actually execute your jobs.
    config.good_job.execution_mode = :external

    if ENV['RAILS_LOG_TO_STDOUT'].present?
      logger           = ActiveSupport::Logger.new($stdout)
      logger.formatter = config.log_formatter
      config.logger    = ActiveSupport::TaggedLogging.new(logger)
    end

    default_log_level = ENV['DEBUG'].present? ? :debug : :info
    config.log_level = ENV['LOG_LEVEL'].presence&.to_sym || default_log_level

    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end
