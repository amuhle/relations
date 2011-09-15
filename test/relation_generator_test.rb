require "test_helper"
require "generators/relation/relation_generator"

class RelationGeneratorTest < Rails::Generators::TestCase
	tests Relation::Generators::RelationGenerator

	destination File.expand_path("../tmp", __FILE__)

	setup do 
		prepare_destination
		copy_app
	end

	test 'has_many relation between user and task' do
		run_generator %w(user has_many task)
	    match_user = /has_many :tasks/
		assert_file "app/models/user.rb", match_user
	    match_task = /belongs_to :user/
		assert_file "app/models/task.rb", match_task
		assert_migration "db/migrate/relate_users_to_tasks.rb"
	end

	test 'belongs_to relation between task and user' do
		run_generator %w(task belongs_to user)
	    match_user = /has_many :tasks/
		assert_file "app/models/user.rb", match_user
	    match_task = /belongs_to :user/
		assert_file "app/models/task.rb", match_task
		assert_migration "db/migrate/relate_tasks_to_users.rb"
	end

	test 'has_and_belongs_to_many relation between user and task' do
		run_generator %w(user has_and_belongs_to_many task)
	    match_user = /has_and_belongs_to_many :tasks/
		assert_file "app/models/user.rb", match_user
	    match_task = /has_and_belongs_to_many :users/
		assert_file "app/models/task.rb", match_task
		assert_migration "db/migrate/relate_users_to_tasks.rb"
	end

	test 'has_one relation between user and task' do
		run_generator %w(user has_one task)
	    match_user = /has_one :task/
		assert_file "app/models/user.rb", match_user
	    match_task = /belongs_to :user/
		assert_file "app/models/task.rb", match_task
		assert_migration "db/migrate/relate_users_to_tasks.rb"
	end

	def copy_app
		app = File.expand_path("../test_app/app", __FILE__)
		destination = File.join(destination_root, "")

	    FileUtils.mkdir_p(destination)
	    FileUtils.cp_r app, destination
	end
end
