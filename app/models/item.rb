class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :estimated_shipping_date

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
  validates :name
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :description
  validates :category_id
  validates :status_id
  validates :shipping_charge_id
  validates :prefecture_id
  validates :estimated_shipping_date_id
 end

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :estimated_shipping_date_id, numericality: { other_than: 1 }
end
