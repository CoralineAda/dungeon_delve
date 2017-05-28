class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :handle, null: false
      t.string :twitter_id, null: false
      t.string :name, null: false
      t.datetime :queued_at
      t.timestamps null: false
    end
  end
end
