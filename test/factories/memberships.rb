FactoryBot.define do
  factory :membership do
    group { Group.order(Arel.sql("RANDOM()")).first || create(:group) }
    user { User.order(Arel.sql("RANDOM()")).first || create(:user) }
  end
end
