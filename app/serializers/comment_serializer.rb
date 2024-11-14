class CommentSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper

  attributes :body, :posted_at, :posted_by

  def posted_at
    "#{time_ago_in_words(object.created_at)} ago"
  end

  def posted_by
    object.user.full_name
  end
end
