ENV["RAILS_ENV"] = "test"

$:.unshift File.dirname(__FILE__)

require "test_app/config/environment"
require "rails/test_help"
require "orm/active_record"

# For generators
require "rails/generators/test_case"
require "generators/relation/relation_generator"

