class Monster < ActiveRecord::Base

  has_many :battles

  attr_reader :name, :hp, :att

  #def initialize(name, hp, att)
  #  @name = name
  #  @hp = hp
  #  @att = att
  #end

  def attack(hero_att)
    @hp -= hero_att
  end

end
