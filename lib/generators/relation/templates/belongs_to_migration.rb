class Relate<%= model_one.capitalize.pluralize %>To<%= model_two.capitalize.pluralize %> < ActiveRecord::Migration
  def self.up
    add_column :<%= table_name %>, :<%= fk %>, :integer
  end

  def self.down
    remove_column :<%= table_name %>, :<%= fk %>
  end
end
