class CreateYelpData < ActiveRecord::Migration
  def change
    create_table :yelp_data do |t|
      t.string :data
      t.integer :merge_id

      t.timestamps null: false
    end
  end
end
