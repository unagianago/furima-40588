require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できる場合' do
      it 'nameとcontentとcategory_idとcondition_idとarea_idとdelivery_cost_idとdelivery_time_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it '写真が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'contentが空では登録できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end

      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'condition_idが1では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it 'delivery_cost_idが1では登録できない' do
        @item.delivery_cost_id= 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery cost must be other than 1")
      end

      it 'area_idが1では登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end

      it 'delivery_time_idが1では登録できない' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time must be other than 1")
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが0から299では登録できない' do
        @item.price = 111
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが10000000以上では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it 'priceが全角を含む文字では登録できない' do
        @item.price = '1あ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceが半角英字を含む文字では登録できない' do
        @item.price = '1a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end

  end

end
