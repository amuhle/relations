class CreateRelation<%= model_one.capitalize %><%= model_two.capitalize %> < ActiveRecord::Migration
    def change
        add_column :<%= table_name %>, :<%= fk %>, :integer
    end
end
