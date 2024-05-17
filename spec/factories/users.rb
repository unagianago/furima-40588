FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name {'横山'}
    last_name {'文哉'}
    first_name_sub {'ヨコヤマ'}
    last_name_sub {'フミヤ'}
    birthday {'1996-04-23'}
  end
end