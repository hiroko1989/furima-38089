class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchase_form = PurchaseForm.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_form =PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_form).permit(:title, :image, :description, :category_id, :condition_id, :prefecture_id, :shipping_date_id, :delivery_charge_id, :price,:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end