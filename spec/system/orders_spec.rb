require 'rails_helper'

RSpec.describe "商品購入", type: :system do
  before do
    @item = FactoryBot.create(:item)
    @item2 = FactoryBot.create(:item)
    @order = FactoryBot.create(:order)
  end

  context '商品の購入【売却前】' do
    it 'ログアウト状態のユーザーは購入ページに行けず、ログインページへ移動' do
      visit item_orders_path(@item)
      expect(current_path).to eq new_user_session_path
    end
    it 'ログイン状態の出品者が購入ページに行くとトップページへ移動' do
      sign_in(@item.user)
      visit item_orders_path(@item)
      expect(current_path).to eq root_path
    end
    it 'ログイン状態のユーザーは購入ページへ移動' do
      sign_in(@item2.user)
      visit item_orders_path(@item)
      expect(current_path).to eq item_orders_path(@item)
    end
  end

  context'商品の購入【売却後】' do
    it 'ログイン状態の出品者はトップページへ移動' do
      sign_in(@order.item.user)
      visit item_orders_path(@order.item)
      expect(current_path).to eq root_path
    end
    it 'ログイン状態のユーザーはトップページへ移動' do
      sign_in(@item.user)
      visit item_orders_path(@order.item)
      expect(current_path).to eq root_path
    end
    it 'ログインしていないユーザーはトップページへ移動' do
      visit item_orders_path(@order.item)
      expect(current_path).to eq root_path
    end 
  end
end
