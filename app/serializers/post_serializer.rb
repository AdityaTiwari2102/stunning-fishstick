class PostSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper

  attributes :body, :claps_count, :comments_count, :posted_at, :group_name

  belongs_to :user, serializer: UserSerializer
  has_many :comments, serializer: CommentSerializer

  def posted_at
    "#{time_ago_in_words(object.created_at)} ago"
  end

  def group_name
    object.group.title
  end
end
