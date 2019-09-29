# frozen_string_literal: true

module V1
  class MoviesController < ApplicationController
    before_action :authenticate_user!

    def index
      render json: Movie.all
    end

    def show
      render json: set_movie
    end

    def create
      movie = Movie.new(movie_params)

      if movie.save
        render json: movie, status: :created
      else
        render json: movie.errors, status: :unprocessable_entity
      end
    end

    def update
      if set_movie.update(movie_params)
        render json: set_movie
      else
        render json: set_movie.errors, status: :unprocessable_entity
      end
    end

    def destroy
      if set_movie.destroy!
        render json: { success: true }, status: :ok
      else
        render json: set_movie.errors, status: :unprocessable_entity
      end
    end

    private

    def set_movie
      @set_movie ||= Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :description, :recommended, :age_rating, :release_data)
    end
  end
end
