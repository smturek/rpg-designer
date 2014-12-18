class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to items_path
  end

  def edit
    set_item
  end

  def update
    set_item
    @item.update(item_params)
    redirect_to items_path
  end

  def destroy
    set_item
    @item.destroy
    redirect_to items_path
  end


private

  def item_params
    params.require(:item).permit(:name, :type, :health, :attack, :hero_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end
