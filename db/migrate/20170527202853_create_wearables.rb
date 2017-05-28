class CreateWearables < ActiveRecord::Migration[5.1]
  def change
    create_table :wearables do |t|
      t.string :name
      t.boolean :is_worn, default: false
      t.boolean :is_magical, default: false
      t.integer :owner_id
      t.integer :room_id
      t.timestamps null: false
    end
  end
end
