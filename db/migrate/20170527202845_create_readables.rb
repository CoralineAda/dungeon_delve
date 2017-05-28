class CreateReadables < ActiveRecord::Migration[5.1]
  def change
    create_table :readables do |t|
      t.string :name
      t.text :text
      t.integer :owner_id
      t.integer :room_id
      t.timestamps null: false
    end
  end
end
