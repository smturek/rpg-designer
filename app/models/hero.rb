class Hero < ActiveRecord::Base
  has_many :battles

  attr_reader :name, :hp, :att

  #def initialize(name, hp, att)
  #  @name = name
  #  @hp = hp
  #  @att = att
  #end

  def attack(monster_att)
    @hp -= monster_att
  end

end
