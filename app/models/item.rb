class Item < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :shipping_charges_id, presence: true
  validates :prefecture_id, presence: true
  validates :estimated_shipping_date_id, presence: true
end
