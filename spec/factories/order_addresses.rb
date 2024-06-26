FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    town { '茅ヶ崎市' }
    house_number { '2-4' }
    building { 'パークタウン' }
    phone_number { Faker::Number.between(from: 1_000_000_000, to: 99_999_999_999) }
    area_id { Faker::Number.between(from: 2, to: 48) }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
