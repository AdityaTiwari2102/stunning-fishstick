class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :phone_number, :email, :user_type, :groups_count, :posts_count, :joined_at

  def user_type
    object.user_type.titleize
  end

  def joined_at
    object.created_at.strftime("%D")
  end
end
