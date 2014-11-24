class Hero < ActiveRecord::Base

  has_many :battles

  def attack(monster_att)
    self.hp -= monster_att
  end

end
