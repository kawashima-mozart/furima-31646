class OrdersController < ApplicationController
  before_action :move_to_index

  def index
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new
    redirect_to root_path if @item.user.id == current_user.id
  end

  def create
    binding.pry
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new(order_params)
    redirect_to root_path if @item.user_id == current_user.id
    if @item_order.valid?
      pay_item
      @item_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:item_order).permit(:postal_code, :shipment_source_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

end
