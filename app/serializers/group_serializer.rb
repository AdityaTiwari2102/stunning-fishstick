class GroupSerializer < ActiveModel::Serializer
  attributes :title, :posts_count, :users_count, :created_at
end
