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
    @battle.initiate_battle(@battle.hero)
    @battle.hero.current_health = @battle.hero.max_health
    @battle.hero.save!
    @battle.monster.current_health = @battle.monster.max_health
    @battle.monster.save!
    @battle.save
    redirect_to edit_battle_path(@battle)
  end

  def edit
    set_battle
    if @battle.monster.current_health <= 0
      @battle.hero.experience += 1
      @battle.hero.save!
    end
    if @battle.hero.current_health <= 0 || @battle.monster.current_health <= 0
      redirect_to battle_path(@battle)
    end
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
    @battle.hero.attack(@battle.monster.base_attack)
    if @battle.monster.current_health <= 0
      Battle.transaction do
        @battle.hero.save!
        @battle.monster.save!
      end
      redirect_to battle_path(@battle)
    else
      @battle.monster.attack(@battle.hero.current_attack)
      Battle.transaction do
        @battle.hero.save!
        @battle.monster.save!
      end
      if @battle.hero.current_health <= 0
        redirect_to battle_path(@battle)
      else
        redirect_to edit_battle_path(@battle)
      end
    end
  end

  private

  def set_battle
    @battle = Battle.find(params[:id])
  end

  def battle_params
    params.require(:battle).permit(:hero_id, :monster_id)
  end

end
