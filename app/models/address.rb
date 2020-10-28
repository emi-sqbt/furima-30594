class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :postal_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_number
    validates :building_number
    validates :phone_number
  end

end
