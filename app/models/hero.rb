class Hero < ActiveRecord::Base

  has_many :battles

  def attack(monster_attack)
    self.base_health -= monster_attack
  end

end
