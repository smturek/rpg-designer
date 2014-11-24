class BattlesController < ApplicationController

  #$hero = Hero.new("Good Guy", 10, 10)
  #$monster = Monster.new("Bad Guy", 50, 1)

  def index
    @battles = Battle.all
  end

  def new
    @heroes = Hero.all
    @monsters = Monster.all
    $hero = @heroes.sample
    $monster = @monsters.sample
  end

  def create
    @battle = Battle.new(battle_params)
    @battle.save
    redirect_to edit_battle_path(@battle)
  end

  def edit
    set_battle
  end

  def fight
    $hero.attack($monster.att)
    $monster.attack($hero.att)
    @hero = $hero
    @monster = $monster
    if @hero.hp <= 0
      redirect_to defeat_path
    end
    if @monster.hp <= 0
      redirect_to victory_path
    end
  end

  def destroy
    set_battle
    @battle.destroy
    redirect_to battles_path
  end

  def update
    set_battle
    @battle.update(battle_params)
    redirect_to battle_path(@battle)
  end

  private

  def set_hero
    @hero = Hero.find(@battle.hero_id)
  end

  def set_monster
    @monster = Monster.find(@battle.monster_id)
  end

  def set_battle
    @battle = Battle.find(params[:id])
  end

  def battle_params
    params.require(:battle).permit(:hero_id, :monster_id)
  end

end
