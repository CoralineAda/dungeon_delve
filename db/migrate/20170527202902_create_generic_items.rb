class CreateGenericItems < ActiveRecord::Migration
  def change
    create_table :generic_items do |t|
      t.string :name
      t.integer :owner_id
      t.integer :place_id
      t.timestamps null: false
    end
  end
end
