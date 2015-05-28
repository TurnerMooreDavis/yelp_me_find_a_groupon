class CreateYelpData < ActiveRecord::Migration
  def change
    create_table :yelp_data do |t|

      t.timestamps null: false
    end
  end
end
