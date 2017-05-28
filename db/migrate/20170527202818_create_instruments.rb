class CreateInstruments < ActiveRecord::Migration[4.2]
  def change
    create_table :instruments do |t|
      t.string :name
      t.boolean :is_magical, default: false
      t.integer :owner_id
      t.integer :room_id
      t.timestamps null: false
    end
  end
end
