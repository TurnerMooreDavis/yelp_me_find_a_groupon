class CreateGrouponData < ActiveRecord::Migration
  def change
    create_table :groupon_data do |t|
      t.string :data

      t.timestamps null: false
    end
  end
end
