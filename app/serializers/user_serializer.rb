class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :last_name, :sign_in_count
end
