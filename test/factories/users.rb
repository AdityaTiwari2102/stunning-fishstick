require "open-uri"

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name if Faker::Boolean.boolean }
    phone_number { Faker::PhoneNumber.cell_phone_in_e164 if Faker::Boolean.boolean }
    email { Faker::Internet.unique.email }

    # Attach a photo using Active Storage
    after(:build) do |user|
      filename = "user-#{user_id}"
      user.photo.attach(io: URI.parse(Faker::Avatar.image).open, filename:)
    end

    trait :with_last_name do
      last_name { Faker::Name.last_name }
    end

    trait :with_phone do
      phone { Faker::PhoneNumber.cell_phone_in_e164 }
    end

    trait :with_membership do
      after(:create) do |user|
        create(:membership, user:)
      end
    end
  end
end
