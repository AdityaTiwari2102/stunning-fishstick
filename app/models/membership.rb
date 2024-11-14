class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :group

  counter_culture :user, column_name: "groups_count"
  counter_culture :group, column_name: "users_count"
end
