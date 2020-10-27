require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do
      context '商品出品がうまくいくとき' do
        it 'すべての項目が存在すれば登録できる' do
          expect(@item).to be_valid
        end

        it '販売価格が￥300~であれ保存出来る' do
          @item.shipping_charge_id = '300'
          expect(@item).to be_valid
        end
      end
      context '新規登録がうまくいかないとき' do
        it '商品画像が空だと保存でない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名が空だと保存でない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it '商品説明が空だと保存でない' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it 'カテゴリー情報が空だと保存でない' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it '商品の状態についての情報が空だと保存でない' do
          @item.status_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank")
        end
        it '配送料の負担についての情報が空だと保存でない' do
          @item.shipping_charge_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping charge is not a number')
        end
        it '配送元の地域についての情報が空だと保存でない' do
          @item.prefecture_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it '発送日までの日数についての情報が空だと保存でない' do
          @item.estimated_shipping_date_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Estimated shipping date can't be blank", 'Estimated shipping date is not a number')
        end
        it '価格についての情報が空だと保存でない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it '価格が￥10000000以上だと保存でない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end
        it '価格が￥300未満だと保存でない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        end
        it '販売価格が半角数字でないと保存できない' do
          @item.price = '５００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end
        it 'userが紐付いていないと保存できないこと' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end
        it 'カテゴリー情報が--だと保存でない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end
        it '商品の状態についての情報が--だと保存でない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Status must be other than 1')
        end
        it '配送料の負担についての情報が--だと保存でない' do
          @item.shipping_charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping charge must be other than 1')
        end
        it '配送元の地域についての情報が--だと保存でない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
        end
        it '発送日までの日数についての情報が--だと保存でない' do
          @item.estimated_shipping_date_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Estimated shipping date must be other than 1')
        end
      end
    end
  end
end
