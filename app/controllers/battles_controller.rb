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
    if @battle.hero.current_health <= 0 || @battle.monster.current_health <= 0
      redirect_to battle_path(@battle)
    end
  end

  def show
    set_battle
    if @battle.monster.current_health <= 0
      if @battle.hero.level <= 3
        @battle.hero.experience += 5
      elsif @battle.hero.level <= 10
        @battle.hero.experience += 2
      else
        @battle.hero.experience += 1
      end
      @battle.hero.save!
    end
  end

  def destroy
    set_battle
    @battle.destroy
    redirect_to battles_path
  end

  def update
    set_battle

    # hero attacks
    # if the monster is still alive, the monster attacks
    # then respond
    @battle.monster.get_attacked(@battle.hero.base_attack)
    respond_to do |format|
      if @battle.monster.current_health <= 0
        Battle.transaction do
          @battle.hero.save!
          @battle.monster.save!
        end
        format.html do
          redirect_to battle_path(@battle)
        end
        format.js do
          render json: {
            battle: @battle,
            hero: {current_health: @battle.hero.current_health,
              max_health: @battle.hero.max_health},
              monster: {current_health: @battle.monster.current_health,
                max_health: @battle.monster.max_health},
            redirect: battle_path(@battle)
          }
        end
      else
        @battle.hero.get_attacked(@battle.monster.current_attack)
        Battle.transaction do
          @battle.hero.save!
          @battle.monster.save!
        end
        if @battle.hero.current_health <= 0
          format.html do
            redirect_to battle_path(@battle)
          end
          format.js do
            render json: {
              battle: @battle,
              hero: {current_health: @battle.hero.current_health,
                max_health: @battle.hero.max_health},
                monster: {current_health: @battle.monster.current_health,
                  max_health: @battle.monster.max_health},
              redirect: battle_path(@battle)
            }
          end
        else
          format.html do
            redirect_to edit_battle_path(@battle)
          end
          format.js do
            render json: {
              battle: @battle,
              hero: {current_health: @battle.hero.current_health,
                max_health: @battle.hero.max_health},
              monster: {current_health: @battle.monster.current_health,
                max_health: @battle.monster.max_health}
            }
          end
        end
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
