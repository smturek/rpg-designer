class ChangedCharactersAndMonsters < ActiveRecord::Migration
  def change
    change_table :characters do |t|
      t.remove :agi, :str, :int, :vit, :char_class
      t.rename :mp, :att
    end

    rename_table :characters, :heroes

    rename_column :monsters, :mp, :att

  end
end
