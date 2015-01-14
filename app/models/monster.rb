class Monster < ActiveRecord::Base

  has_many :battles, dependent: :destroy

  def get_attacked(hero_attack)
    damage = hero_attack
    rand_dmg = rand(1..100)/100.to_f
    damage += damage*rand_dmg
    self.current_health -= damage.round
  end

  def starting_values
    self.current_attack = base_attack
    self.max_health = base_health
    save
  end

end
