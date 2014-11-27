class ChangeItemsAndHeros < ActiveRecord::Migration
  def change
    change_table :heros do |t|
      t.integer :base_health
      t.integer :max_health
      t.integer :base_attack
      t.integer :max_attack
    end

    change_table :monsters do |t|
      t.integer :base_health
      t.integer :max_health
      t.integer :base_attack
      t.integer :max_attack
    end

    rename_column :heros, :hp, :current_health
    rename_column :heros, :att, :current_attack

    rename_column :monsters, :hp, :current_health
    rename_column :monsters, :att, :current_attack

    rename_column :items, :type, :item_type

  end
end
