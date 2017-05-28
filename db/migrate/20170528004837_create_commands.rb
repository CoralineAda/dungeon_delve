class CreateCommands < ActiveRecord::Migration[5.1]
  def change
    create_table :commands do |t|
      t.string :name
      t.text :synonyms
      t.string :handler_class
      t.string :handler_method
      t.boolean :takes_arguments, default: false
      t.timestamps
    end
  end
end
