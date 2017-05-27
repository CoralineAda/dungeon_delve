class CreateInstruments < ActiveRecord::Migration[4.2]
  def change
    create_table :instruments do |t|
      t.string :name
      t.integer :owner_id
      t.integer :place_id
      t.timestamps null: false
    end
  end
end
