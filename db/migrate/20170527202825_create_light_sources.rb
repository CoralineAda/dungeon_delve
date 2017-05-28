class CreateLightSources < ActiveRecord::Migration[5.1]
  def change
    create_table :light_sources do |t|
      t.string :name
      t.integer :owner_id
      t.integer :room_id
      t.boolean :is_lit
      t.timestamps null: false
    end
  end
end
