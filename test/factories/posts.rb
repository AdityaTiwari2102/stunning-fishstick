FactoryBot.define do
  factory :post do
    body { Faker::Lorem.paragraphs.join(" ") }
    group { Group.order(Arel.sql("RANDOM()")).first || create(:group) }
    user { User.order(Arel.sql("RANDOM()")).first || create(:user) }

    trait :with_comments do
      transient do
        comments_count { rand(1...17) }
      end

      after(:create) do |post, evaluator|
        create_list(:comment, evaluator.comments_count, post:)
      end
    end
  end
end
