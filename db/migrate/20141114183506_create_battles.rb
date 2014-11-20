class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.string :hero_name
      t.string :hero_hp
      t.string :hero_att
      t.string :monster_name
      t.string :monster_hp
      t.string :monster_att
    end
  end
end
