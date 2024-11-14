class User < ApplicationRecord
  normalizes :email, with: ->(email) { email&.downcase&.strip }

  has_one_attached :photo
  has_many :comments
  has_many :posts
  has_many :memberships
  has_many :groups, through: :memberships

  validates :first_name, :email, presence: true
  validates :email, uniqueness: true

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
