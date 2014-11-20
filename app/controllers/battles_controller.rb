class BattlesController < ApplicationController

  def index
    @battles = Battle.all
  end

  def new
    @battle = Battle.new
    @heroes = Hero.all
    @monsters = Monster.all
  end

  def create
    @battle = Battle.new(battle_params)
    @battle.save
    redirect_to edit_battle_path(@battle)
  end

  def edit
    set_battle
  end

  def show
    set_battle
  end

  def destroy
    set_battle
    @battle.destroy
    redirect_to battles_path
  end

  def update
    set_battle
    set_hero
    @battle.hero.hp -= @battle.monster.att
    @hero.update(params.require(:hero).permit(:name))
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
