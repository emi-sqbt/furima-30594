require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '商品購入' do
    before do
      @order_form = FactoryBot.build(:order_form)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_form).to be_valid
    end
    it 'building_numberがなくても保存できる' do
      @order_form.building_number = ""
      expect(@order_form).to be_valid
    end
    it '郵便番号が空だと保存できないこと' do
      @order_form.postal_number = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal number can't be blank")
    end
    it '都道府県が空だと保存できないこと' do
      @order_form.prefecture_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町が空だと保存できないこと' do
      @order_form.city = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと保存できないこと' do
      @order_form.house_number = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("House number can't be blank")
    end
    it '電話番号が空だと保存できないこと' do
      @order_form.phone_number = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
    end
    it '郵便番号には-がないと保存できないこと' do
      @order_form.postal_number = 1_234_567
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Postal number is invalid. Include hyphen(-)')
    end
    it '電話番号には-があると保存できないこと' do
      @order_form.phone_number = 123 - 4564 - 7890
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Phone number is invalid. Input half-width numbers.')
    end
    it '電話番号は11桁いかでないと保存できないこと' do
      @order_form.phone_number = 111_111_111_111
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Phone number is invalid. Input half-width numbers.')
    end
    it 'user_idが空だと保存できないこと' do
      @order_form.user_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空だと保存できないこと' do
      @order_form.item_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Item can't be blank")
    end
    it 'tokenが空では登録できないこと' do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
    end
    it '電話番号が数字のみでないと保存できないこと' do
      @order_form.phone_number = 'あああ１１１'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid. Input half-width numbers.")
    end

  end
end
