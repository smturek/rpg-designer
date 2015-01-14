class Hero < ActiveRecord::Base

  has_many :battles, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :skills, dependent: :destroy

  def get_attacked(monster_attack)
    damage = monster_attack
    rand_dmg = rand(1..100)/100.to_f
    damage += damage*rand_dmg
    self.current_health -= damage.round
  end

  def starting_values
    item_health = 0
    item_attack = 0
    items.each do |item|
      item_health += item.health
      item_attack += item.attack
    end
    self.current_attack = base_attack + item_attack
    self.max_health = base_health + item_health
    save
  end

end
