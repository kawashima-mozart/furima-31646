require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '購入情報と住所情報が登録' do
    before do
    @item_order = FactoryBot.build(:item_order)
    end

  

    context '登録できるとき' do
      it 'すべての数値が入っていれば保存できる' do
        expect(@item_order).to be_valid
      end
    end

    context '登録できないとき' do
      it '郵便番号がないとき' do
        @item_order.postal_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号に−がないとき' do
        @item_order.postal_code = '1234567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Postal code is invalid')
      end
      it '都道府県がないとき' do
        @item_order.shipment_source_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Shipment source can't be blank")
      end
      it '市区町村ががないとき' do
        @item_order.city = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end
      it '番地がないとき' do
        @item_order.address = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号がないとき' do
        @item_order.phone_number = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号に−がはいっていて11文字以上となるとき' do
        @item_order.phone_number = '12-1234-1234'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空のとき' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
