class FixedClassColumn < ActiveRecord::Migration
  def change
    rename_column :characters, :class, :char_class
  end
end
