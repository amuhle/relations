class Relate<%= model_one.capitalize.pluralize %>To<%= model_two.capitalize.pluralize %>  < ActiveRecord::Migration
  def change
    create_table :<%= table_name %> do |t|
      t.integer <%= model_one %>_id,
      t.integer <%= model_two %>_id,
      t.timestamps
    end
  end
end
