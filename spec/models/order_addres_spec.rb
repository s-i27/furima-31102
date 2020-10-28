require 'rails_helper'

RSpec.describe OrderAddres, type: :model do
  describe '購入情報の保存' do
    before do
      @order_addres = FactoryBot.build(:order_addres)
    end
    context '購入情報の保存ができる時' do
      it 'すべての情報があれば購入情報は保存される' do
        expect(@order_addres).to be_valid
      end
      it 'buildingが空でも購入情報は保存される' do
        @order_addres.building = ''
        expect(@order_addres).to be_valid
      end
    end

    context '購入情報の保存ができない時' do
      it 'postcodeが空だと登録できない' do
        @order_addres.postcode = ''
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと登録できない' do
        @order_addres.postcode = '1111111'
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include('Postcode Input correctly')
      end
      it 'prefecture_idが1(デフォルト)だと登録できない' do
        @order_addres.prefecture_id = 1
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include('Prefecture Select')
      end
      it 'blockが空だと登録できない' do
        @order_addres.block = ''
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include("Block can't be blank")
      end
      it 'cityが空だと登録できない' do
        @order_addres.city = ''
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include("City can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @order_addres.phone_number = ''
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数値以外だと登録できない' do
        @order_addres.phone_number = '１'
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include('Phone number Input only number')
      end
      it 'tokenが空では登録できないこと' do
        @order_addres.token = nil
        @order_addres.valid?
        expect(@order_addres.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
