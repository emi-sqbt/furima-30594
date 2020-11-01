class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_number, :prefecture_id, :city, :house_number, :building_number, :phone_number, :user_id, :item_id, :order_id
  attr_accessor :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :postal_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input half-width numbers.' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_number: postal_number, prefecture_id: prefecture_id, city: city, house_number: house_number, building_number: building_number, phone_number: phone_number)
  end
end
