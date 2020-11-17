class OrdersController < ApplicationController
  before_action :sold_out_check
  before_action :move_to_index
  before_action :owner_move_index

  def index
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(order_params)
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

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def owner_move_index
    redirect_to root_path if @item.user.id == current_user.id
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def sold_out_check
    @item = Item.find(params[:item_id])
      redirect_to root_path if @item.order.present?
  end
end
