class CreateLightSources < ActiveRecord::Migration
  def change
    create_table :light_sources do |t|
      t.string :name
      t.integer :owner_id
      t.integer :place_id
      t.boolean :is_lit
      t.timestamps null: false
    end
  end
end
