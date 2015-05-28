class CreateMerges < ActiveRecord::Migration
  def change
    create_table :merges do |t|

      t.timestamps null: false
    end
  end
end
