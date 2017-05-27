class CreateReadables < ActiveRecord::Migration
  def change
    create_table :readables do |t|
      t.string :name
      t.text :text
      t.integer :owner_id
      t.integer :place_id
      t.timestamps null: false
    end
  end
end
