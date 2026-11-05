ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  parallelize(workers: :number_of_processors)
  # Legacy fixture files in this repo refer to older table names and aren’t compatible
  # with the Rails 8 migration, so we intentionally avoid loading them for now.
end
