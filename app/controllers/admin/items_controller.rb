class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to admin_path
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :genre_id)
  end
end
