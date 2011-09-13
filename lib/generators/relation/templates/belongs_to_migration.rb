class CreateRelation<%= model_one.capitalize %><%= model_two.capitalize %> < ActiveRecord::Migration
    def self.up
        add_column :<%= table_name %>, :<%= fk %>, :integer
    end

    def self.down
        remove_column :<%= table_name %>, :<%= fk %>
    end
end
