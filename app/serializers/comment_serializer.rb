class CommentSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper

  attributes :body, :posted_at, :posted_by

  def posted_at
    "#{time_ago_in_words(object.created_at)} ago"
  end

  def posted_by
    {
      name: object.user.full_name,
      photo: object.user.photo&.url
    }
  end
end
