class Monster < ActiveRecord::Base

  has_many :battles

  def attack(hero_att)
    self.current_health -= hero_att
  end

end
