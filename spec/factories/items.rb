FactoryBot.define do
  factory :item do
    name { 'サンプル' }
    price { 5000 }
    description { Faker::Lorem.sentence }
    category_id { 2 }
    status_id { 2 }
    shipping_charge_id { 2 }
    prefecture_id { 2 }
    estimated_shipping_date_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
