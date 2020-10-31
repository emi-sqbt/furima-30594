class OrdersController < ApplicationController

  def index
    @order_form = OrderForm.new
    @item = Item.find(params[:item_id])
    
    
  end
  


  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
       @order_form.save
       redirect_to root_path
    else
       render action: :index
    end

  end

  private

  def order_params
    params.require(:order_form).permit(:prefecture_id, :postal_number, :city, :house_number, :building_number, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]   # 自身のPAY.JPテスト秘密鍵を記述しましょう
     Payjp::Charge.create(
     amount: Item.find(params[:item_id]).price,  # 商品の値段
     card: order_params[:token],    # カードトークン
     currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end


end

