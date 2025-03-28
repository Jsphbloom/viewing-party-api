class Api::V1::MoviesController < ApplicationController

  def index
    movies = MovieGateway.popular_movies
    render json: movies
  end
end