class Monster < ActiveRecord::Base

  has_many :battles

  def attack(hero_att)
    self.hp -= hero_att
  end

end
