FactoryBot.define do
  factory :group do
    title { "#{Faker::Restaurant.name} @ #{Faker::Sport.unusual_sport}" }

    trait :with_membership do
      after(:create) do |group|
        create(:membership, group:)
      end
    end
  end
end
