# frozen_string_literal: true

module V1
  class RecommendedMoviesController < ApplicationController
    before_action :authenticate_user!

    def index
      render json: Movie.suggested
    end
  end
end
