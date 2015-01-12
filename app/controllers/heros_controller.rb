class HerosController < ApplicationController

  def index
    @heroes = Hero.all
  end

  def new
    @hero = Hero.new
  end

  def create
    @hero = Hero.new(hero_params)
    @hero.max_health = @hero.base_health
    @hero.current_health = @hero.base_health
    @hero.experience = 0
    @hero.save
    redirect_to heros_path
  end

  def show
    set_hero
  end

  def edit
    set_hero
  end

  def update
    set_hero
    @hero.update(hero_params)
    redirect_to heros_path
  end

  def destroy
    set_hero
    @hero.destroy
    redirect_to heros_path
  end

  private

  def hero_params
    params.require(:hero).permit(:name, :base_health, :current_health, :max_health,
                                :base_attack, :current_attack, :max_attack, :experience)
  end

  def set_hero
    @hero = Hero.find(params[:id])
  end

end
