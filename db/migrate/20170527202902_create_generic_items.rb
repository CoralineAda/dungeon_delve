class CreateGenericItems < ActiveRecord::Migration[5.1]
  def change
    create_table :generic_items do |t|
      t.string :name
      t.integer :owner_id
      t.integer :room_id
      t.timestamps null: false
    end
  end
end
