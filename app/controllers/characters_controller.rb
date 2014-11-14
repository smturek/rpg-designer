class CharactersController < ApplicationController

  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(char_params)
    @character.save
    redirect_to characters_path
  end

  def show
    set_char
  end

  def edit
    set_char
  end

  def update
    set_char
    @character = Character.new(char_params)
    @character.save
    redirect_to characters_path
  end

  def destroy
    set_char
    @character.destroy
    redirect_to characters_path
  end

  private

  def char_params
    params.require(:character).permit(:name, :char_class, :hp, :mp, :str, :agi, :int, :vit)
  end

  def set_char
    @character = Character.find(params[:id])
  end

end
