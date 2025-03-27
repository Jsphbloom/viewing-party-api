class Api::V1::MoviesController < ApplicationController

  def index
    render json: MovieSerializer.format_movie_list(Movie.all)
  end
end