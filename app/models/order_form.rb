class UserOrder
  include ActiveModel::Model
  attr_accessor :name, :price, :shipping_charge_id, :postal_number, :prefecture_id, :city, :house_number, :building_number, :phone_number 

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :postal_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_number
    validates :building_number
    validates :phone_number
  end

  def save

    Order.create(user_id: user_id, item_id: item_id )

    Address.create(postal_number: postal_number, prefecture_id: prefecture_id, city: city, house_number: house_number, building_number: building_number, phone_number: phone_number)
  end



end