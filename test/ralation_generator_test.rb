require "test_helper"
require "generators/relation/relation_generator"

class RelationGeneratorTest < Rails::Generators::TestCase
	tests Relation::Generators::RelationGenerator

	destination File.expand_path("../tmp", __FILE__)

	setup do 
		prepare_destination
		copy_routes
	end

	test 'has_many relation between user and tasks' do
		run_generator %w(user has_many task)
		assert_file "../test_app/app/models/user.rb"
		assert_file "../test_app/app/models/user.rb"
		assert_migration "../test_app/db/migrate/create_tables.rb"
	end

	def copy_routes
		routes = File.expand_path("../test_app/config/routes.rb", __FILE__)
		destination = File.join(destination_root, "config")

	    FileUtils.mkdir_p(destination)
	    FileUtils.cp routes, destination
	end


end
