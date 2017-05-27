class CreateWearables < ActiveRecord::Migration[4.2]
  def change
    create_table :wearables do |t|
      t.string :name
      t.boolean :is_worn
      t.integer :owner_id
      t.integer :place_id
      t.timestamps null: false
    end
  end
end
