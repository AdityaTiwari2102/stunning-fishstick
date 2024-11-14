FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.sentences.join(" ") }
    post { Post.order(Arel.sql("RANDOM()")).first || create(:post) }
    user { User.order(Arel.sql("RANDOM()")).first || create(:user) }
  end
end
