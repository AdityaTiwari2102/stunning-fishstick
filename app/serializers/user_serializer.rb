class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :phone_number, :email, :groups_count, :posts_count, :joined_at

  def joined_at
    object.created_at.strftime("%D")
  end
end
