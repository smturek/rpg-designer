class BattleController < ApplicationController

  def index

    if :hero_id != nil && :monster_id != nil
      @characters = Character.all
      @monsters = Monster.all
    else
      set_hero
      set_monster
    end
  end

  def fight
    set_hero
    set_monster

    @hero.hp -= @monster.mp
    @monster.hp -= @hero.agi

    if @hero.hp > 0 && @monster.hp > 0
      redirect_to battle_path(hero_id: @hero.id, monster_id: @monster.id)
    elsif @hero.hp > 0 && @monster.hp <= 0
      redirect_to victory_path
    elsif @hero.hp <= 0 && @monster.hp > 0
      redirect_to defeat_path
    end
  end

  private

  def set_hero
    @hero = Character.find(params[:hero_id])
  end

  def set_monster
    @monster = Monster.find(params[:monster_id])
  end

end
