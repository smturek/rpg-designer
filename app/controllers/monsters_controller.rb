class MonstersController < ApplicationController

  def index
    @monsters = Monster.all
  end

  def new
    @monster = Monster.new
  end

  def create
    @monster = Monster.new(monster_params)
    @monster.save
    redirect_to monsters_path
  end

  def show
    set_monster
  end

  def update
    set_monster
    monster.update
    redirect_to monsters_path
  end

  def edit
    set_monster
  end

  def destroy
    set_monster
    monster.destroy
    redirect_to monsters_path
  end

  private

  def monster_params
    params.require(:monster).permit(:name, :hp, :mp)
  end

  def set_monster
    monster = Monster.find(params[:id])
  end
end
