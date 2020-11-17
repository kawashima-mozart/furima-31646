require 'rails_helper'

RSpec.describe "商品詳細表示", type: :system do
  before do
    @item = FactoryBot.create(:item)
    @item2 = FactoryBot.create(:item)
    @order = FactoryBot.create(:order)
  end

  context '商品の詳細表示【売却前】' do
    it 'ログイン状態の出品者には,編集、削除ボタンのみ表示' do
      sign_in(@item.user)
      visit item_path(@item)
      expect(page).to have_content('商品の編集')
      expect(page).to have_content('削除')
      expect(page).not_to have_content('購入画面に進む')
    end
    it 'ログイン状態のユーザーには購入ボタンのみ表示される' do
      sign_in(@item2.user)
      visit item_path(@item)
      expect(page).not_to have_content('商品の編集')
      expect(page).not_to have_content('削除')
      expect(page).to have_content('購入画面に進む')
    end

    it 'ログインしていないユーザーは何も表示されない' do
      visit item_path(@item)
      expect(page).not_to have_content('商品の編集')
      expect(page).not_to have_content('削除')
      expect(page).not_to have_content('購入画面に進む')
    end
  end

  context'商品の詳細表示【売却後】 画像にsould outが表示される' do
    it 'ログイン状態の出品者には,何も表示されない' do
      sign_in(@order.item.user)
      visit item_path(@order.item)
      expect(page).not_to have_content('商品の編集')
      expect(page).not_to have_content('削除')
      expect(page).not_to have_content('購入画面に進む')
      expect(page).to have_content('Sold Out!!')
    end
    it 'ログイン状態のユーザーには、何も表示されない' do
      sign_in(@item.user)
      visit item_path(@order.item)
      expect(page).not_to have_content('商品の編集')
      expect(page).not_to have_content('削除')
      expect(page).not_to have_content('購入画面に進む')
      expect(page).to have_content('Sold Out!!')
    end

    it 'ログインしていないユーザーは何も表示されない' do
      visit item_path(@order.item)
      expect(page).not_to have_content('商品の編集')
      expect(page).not_to have_content('削除')
      expect(page).not_to have_content('購入画面に進む')
      expect(page).to have_content('Sold Out!!')
    end 
  end
end


RSpec.describe "商品情報編集", type: :system do
  before do
    @item = FactoryBot.create(:item)
    @item2 = FactoryBot.create(:item)
    @order = FactoryBot.create(:order)
  end

  context '商品の情報編集【売却前】' do
    it 'ログイン状態のユーザーは編集ページに行けず、トップページへ移動' do
      sign_in(@item2.user)
      visit edit_item_path(@item)
      expect(current_path).to eq root_path
    end
    it 'ログアウト状態のユーザーは編集ページに行けず、ログインページへ移動' do
      visit edit_item_path(@item)
      expect(current_path).to eq new_user_session_path
    end
    it 'ログイン状態の出品者が編集ページに行ける' do
      sign_in(@item.user)
      visit edit_item_path(@item)
      expect(current_path).to eq edit_item_path(@item)
    end
  end

  context'商品情報編集【売却後】' do
    it 'ログイン状態の出品者はトップページへ移動' do
      sign_in(@order.item.user)
      visit edit_item_path(@order.item)
      expect(current_path).to eq root_path
    end
    it 'ログイン状態のユーザーはトップページへ移動' do
      sign_in(@item.user)
      visit edit_item_path(@order.item)
      expect(current_path).to eq root_path
    end

    it 'ログインしていないユーザーはログイン画面へ移動' do
      visit edit_item_path(@order.item)
      expect(current_path).to eq new_user_session_path
    end 
  end
end