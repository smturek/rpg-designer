class Battle < ActiveRecord::Base

  belongs_to :hero
  belongs_to :monster

  def initiate_battle(hero)
    hero.starting_values
    monster.starting_values
  end

end
