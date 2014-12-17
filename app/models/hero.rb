class Hero < ActiveRecord::Base

  has_many :battles, dependent: :destroy

  def attack(monster_attack)
    @damage = monster_attack
    @random = rand(0..1)
    @rand_dmg = rand(1..100)/100.to_f
    if @random == 0
      @damage += @damage*@rand_dmg
    else
      @damage -= @damage*@rand_dmg
    end
    self.current_health -= @damage.round
  end

end
