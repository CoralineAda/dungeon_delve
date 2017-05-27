class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.text :description
      t.string :coords
      t.boolean :is_current, default: false
      t.timestamps null: false
    end
  end
end
