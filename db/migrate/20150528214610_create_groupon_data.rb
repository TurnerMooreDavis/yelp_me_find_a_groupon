class CreateGrouponData < ActiveRecord::Migration
  def change
    create_table :groupon_data do |t|
      t.string :data
      t.integer :merge_id

      t.timestamps 
    end
  end
end
