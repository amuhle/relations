class Relate<%= model_one.capitalize.pluralize %>To<%= model_two.capitalize.pluralize %> < ActiveRecord::Migration
    def change
        add_column :<%= table_name %>, :<%= fk %>, :integer
    end
end
