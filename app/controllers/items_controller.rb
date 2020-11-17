class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :sold_out_check, only: [:edit, :update, :destroy]
  before_action :move_to_sign_in, except: [:index, :show]
  before_action :owner_move_index, only: [:edit, :update]

  def index
    @items = Item.includes(:user, :order).order('created_at DESC')
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
    others_move_index
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    others_move_index
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :shipping_id, :shipment_source_id, :day_of_shipment_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def sold_out_check
    redirect_to root_path if @item.order.present?
  end

  def owner_move_index
    redirect_to root_path if @item.user.id == current_user.id
  end

  def others_move_index
    redirect_to root_path unless @item.user.id == current_user.id
  end

end
