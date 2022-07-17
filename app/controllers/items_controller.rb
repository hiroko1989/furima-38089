class ItemsController < ApplicationController

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:title, :image, :description, :category_id, :condition_id, :prefecture_id, :shipping_date_id, :delivery_charge_id, :price).merge(user_id: current_user.id)
  end

end
