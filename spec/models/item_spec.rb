require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品登録" do
    it 'ユーザー登録している人でないと出品できない' do
      @item.user_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
    it '１枚画像がないと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空欄だと出品できない' do
      @item.title = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it '商品の説明が空欄だと出品できない' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリーの情報が「---」だと出品できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 0')
    end
    it 'カテゴリーの情報が空欄だと出品できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
    end
    it '商品の状態の情報が「---」だと出品できない' do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition must be other than 0')
    end
    it '商品の状態の情報が空欄だと出品できない' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank", 'Condition is not a number')
    end
    it '配送料の負担の情報が「---」だと出品できない' do
      @item.delivery_charge_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery charge must be other than 0')
    end
    it '配送料の負担の情報が空欄だと出品できない' do
      @item.delivery_charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank", 'Delivery charge is not a number')
    end
    it '発送元の地域の情報が「---」だと出品できない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
    end
    it '発送元の地域の情報が空欄だと出品できない' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
    end
    it '発送までの日数の情報が「---」だと出品できない' do
      @item.shipping_date_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping date must be other than 0')
    end
    it '発送までの日数の情報が空欄だと出品できない' do
      @item.shipping_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date can't be blank", 'Shipping date is not a number')
    end
    it '価格が空欄だと出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
    end
    it '価格の範囲が、300円未満だと出品できない' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '価格の範囲が、9,999,999円を超えると出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
  end
end
