class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :handle, null: false
      t.string :twitter_id, null: false
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
