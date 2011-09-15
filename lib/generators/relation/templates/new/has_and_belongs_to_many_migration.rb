class CreateRelation<%= model_one.capitalize %><%= model_two.capitalize %> < ActiveRecord::Migration
    def change
        create_table :<%= table_name %> do |t|
            t.integer <%= model_one %>_id,
            t.integer <%= model_two %>_id,
            t.timestamps
        end
    end
end
