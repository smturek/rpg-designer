class Monster < ActiveRecord::Base

  has_many :battles

  def attack(hero_att)
    self.base_health -= hero_att
  end

end
