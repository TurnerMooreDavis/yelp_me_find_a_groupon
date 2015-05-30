class CreateGrouponDeals < ActiveRecord::Migration
  def change
    create_table :groupon_deals do |t|

      t.timestamps null: false
    end
  end
end
