require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    context '商品が購入できる場合' do
      it 'buildingが空でも登録できる' do
        building = ''
        expect(@order_address).to be_valid
      end

      it 'post_codeとtownとhouse_numberとbuildingとphone_numberとarea_idとtokenが存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'post_codeが空では登録できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeがハイフンを含んでいないと登録できない' do
        @order_address.post_code = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid')
      end

      it 'post_codeが全角を含む文字列では登録できない' do
        @order_address.post_code = 'あ11-1111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid')
      end

      it 'post_codeが3桁ハイフン4桁以外の形では登録できない' do
        @order_address.post_code = '11-111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid')
      end

      it 'townが空では登録できない' do
        @order_address.town = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Town can't be blank")
      end

      it 'house_numberが空では登録できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが全角を含む文字列では登録できない' do
        @order_address.phone_number = 'あ111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが半角英字を含む文字列では登録できない' do
        @order_address.phone_number = 'a111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが9桁以下では登録できない' do
        @order_address.phone_number = '111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが12桁以上では登録できない' do
        @order_address.phone_number = '111111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'tokenが空では登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
