class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.integer :str
      t.integer :agi
      t.integer :int
      t.integer :vit
      t.integer :hp
      t.integer :mp
      t.string :name
      t.string :class
    end
  end
end
