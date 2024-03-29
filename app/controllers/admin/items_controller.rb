class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    item = Item.create(item_params)
    redirect_to item_path(item)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path(item)
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :genre_id, :image)
  end
end
