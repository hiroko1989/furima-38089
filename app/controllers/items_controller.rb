class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  before_action :set_item, only: [:show]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user_id
     redirect_to actioon: :index
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:title, :image, :description, :category_id, :condition_id, :prefecture_id, :shipping_date_id, :delivery_charge_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
