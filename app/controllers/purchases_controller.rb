class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchase_form = PurchaseForm.new
  end

  def create
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
    params.require(:purchase_form).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end


end