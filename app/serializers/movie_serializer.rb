class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :recommended, :age_rating, :release_data
end
