class Hero < ActiveRecord::Base

  has_many :battles

  def attack(monster_attack)
    self.current_health -= monster_attack
  end

end
