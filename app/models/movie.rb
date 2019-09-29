# frozen_string_literal: true

class Movie < ApplicationRecord
  enum age_rating: [
    :suitable_for_all_audiences, :recommended_for_over_7,
    :recommended_for_over_12, :suitable_for_over_15,
    :suitable_for_over_18, :Prohibited
  ]

  validates_presence_of :title, :recommended, :age_rating, :release_data
  validates :title, uniqueness: true
end
