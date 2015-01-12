class MonstersController < ApplicationController

  def index
    @monsters = Monster.all
  end

  def new
    @monster = Monster.new
  end

  def create
    @monster = Monster.new(monster_params)
    @monster.max_health = @monster.base_health
    @monster.current_health = @monster.base_health
    @monster.save
    redirect_to monsters_path
  end

  def show
    set_monster
  end

  def update
    set_monster
    @monster.update(monster_params)
    redirect_to monsters_path
  end

  def edit
    set_monster
  end

  def destroy
    set_monster
    @monster.destroy
    redirect_to monsters_path
  end

  private

  def monster_params
    params.require(:monster).permit(:name, :base_health, :current_health, :max_health,
                                    :base_attack, :current_attack, :max_attack)
  end

  def set_monster
    @monster = Monster.find(params[:id])
  end
end
