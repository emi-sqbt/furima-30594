FactoryBot.define do
  factory :order_form do
    postal_number { '123-1234' }
    prefecture_id { 34 }
    city { '広島' }
    house_number { 'hiroshima' }
    phone_number { 11_111_111_111 }
    user_id { 3 }
    item_id { 3 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
