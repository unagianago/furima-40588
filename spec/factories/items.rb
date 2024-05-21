FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end

    name { Faker::Lorem.word }
    content { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    delivery_cost_id { Faker::Number.between(from: 2, to: 3) }
    area_id { Faker::Number.between(from: 2, to: 48) }
    delivery_time_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user
  end
end
