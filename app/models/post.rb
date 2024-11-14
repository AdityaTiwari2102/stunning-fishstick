class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :comments

  counter_culture :group
  counter_culture :user
end
