class Hero < ActiveRecord::Base

  has_many :battles, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :skills, dependent: :destroy

  def attack(monster_attack)
    damage = monster_attack
    random = rand(0..1)
    rand_dmg = rand(1..100)/100.to_f
    if random == 0
      damage += damage*rand_dmg
    else
      damage -= damage*rand_dmg
    end
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
