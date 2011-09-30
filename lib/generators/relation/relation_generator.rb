require 'rails/generators'
require 'rails/generators/migration'
require 'generators/relation/orm_helpers'

module Relation
	module Generators
		class RelationGenerator < Rails::Generators::Base
			include Rails::Generators::Migration
			include Relation::Generators::OrmHelpers

			attr_accessor :table_name, :fk

			# Returns true if Rails version is bigger than 3.0.x
			def self.is_rails_bigger_than_3_0?
				Rails::VERSION::STRING[0,3] != "3.0"
			end

			def	self.template_path
				rails_version = is_rails_bigger_than_3_0? ? '/new' : ''
				File.expand_path("../templates#{rails_version}", __FILE__)
			end

		  source_root template_path

		  File.expand_path('../templates', __FILE__)
		  argument :model_one, :type => :string
		  argument :relation_type, :type => :string
		  argument :model_two, :type => :string

		  @@opposite_relations = {
	      :belongs_to => :has_many,
	      :has_one => :belongs_to,
	      :has_many => :belongs_to,
	      :has_and_belongs_to_many => :has_and_belongs_to_many
		  }

		  def inject_relation
	      model_contents = get_model_content(relation_type.to_sym, model_two)
	      inject_into_class(model_path(model_one), model_one.to_s.capitalize, model_contents) if model_exists?(model_one)
		  end

		  def inject_opposite_relation
	      model_contents = get_model_content(@@opposite_relations[relation_type.to_sym], model_one)
	      inject_into_class(model_path(model_two), model_two.to_s.capitalize, model_contents) if model_exists?(model_two)
		  end

		  def self.next_migration_number(dirname)
	      migration_number = Time.now.strftime("%Y%m%d%H%M%S").to_i
	      migration_number += 1
	      migration_number.to_s
		  end

		  def create_migration
		    if (model_exists?(model_one) and model_exists?(model_two))
	        if self.fk != ''
       	  	migration_template "belongs_to_migration.rb", "db/migrate/relate_#{model_one.pluralize}_to_#{model_two.pluralize}"
	        else
	        	migration_template "has_and_belongs_to_many_migration.rb", "db/migrate/relate_#{model_one.pluralize}_to_#{model_two.pluralize}"
	        end
		    end
		  end

private

			def get_model_content(rel,entity)

				relations = {
					:belongs_to 							=> "  #{rel} :#{entity}\n",
					:has_one 									=> "  #{rel} :#{entity}\n",
					:has_many 								=> "  #{rel} :#{entity.pluralize}\n",
					:has_and_belongs_to_many 	=> "  #{rel} :#{entity.pluralize}\n"
				}
	
				if rel == :belongs_to
					self.table_name = model_one == entity ? model_two.pluralize : model_one.pluralize
					self.fk = entity + '_id'
				elsif rel == :has_and_belongs_to_many
					self.table_name = model_one.to_s.pluralize + '_' + model_two.to_s.pluralize
					self.fk = ''
				end
	
				relations[rel]
	
			end

		end
  end
end

