class ItemPurchasesController < ApplicationController
  def index
    @item_purchase = ItemPurchase.new
  end

  def create
    @item_purchase = ItemPurchase.new(item_purchase_params)
    if item_purchase.valid?
      @item_purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def item_purchase_params
    params.require(:item_purchase).permit(:user_id, :item_id)
  end

end