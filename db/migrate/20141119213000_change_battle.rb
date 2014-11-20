class ChangeBattle < ActiveRecord::Migration
  def change

    change_table :battles do |t|
      t.remove :hero_name, :hero_hp, :hero_att,
               :monster_name, :monster_hp, :monster_att
      t.belongs_to :hero
      t.belongs_to :monster
    end

  end
end
