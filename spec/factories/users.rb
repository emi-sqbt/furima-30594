FactoryBot.define do
  factory :user do
    family_name           { '田中' }
    first_name            { 'さん' }
    family_name_kana      { 'タナカ' }
    first_name_kana       { 'タカコ' }
    birthday              { Faker::Date.birthday }
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a2b' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
