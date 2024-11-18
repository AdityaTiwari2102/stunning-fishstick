class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :comments

  counter_culture :group
  counter_culture :user

  scope :search, lambda { |query|
    return nil if query.blank?

    search_terms = query.downcase.split(/\s+/).map do |term|
      "#{term.gsub('*', '%').prepend('%')}%".gsub(/%+/, "%")
    end

    where(
      search_terms.map { |_term| "posts.body ILIKE ?" }.join(" OR "),
      *search_terms
    )
  }

  scope :by_group, lambda { |group_id|
    return nil if group_id.blank?

    where(group_id:)
  }
end
