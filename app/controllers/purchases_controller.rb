class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchase_form = PurchaseForm.new
  end

end