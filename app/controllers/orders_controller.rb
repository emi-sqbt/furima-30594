class OrdersController < ApplicationController

  def index
    @order_form = OrderForm.all
  end

  def create
  end

end
