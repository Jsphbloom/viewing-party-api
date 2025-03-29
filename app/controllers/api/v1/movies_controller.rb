class Api::V1::MoviesController < ApplicationController

  def index
    movies = MovieGateway.top_rated_movies
    render json: MovieSerializer.format_movie_list(movies)
  end

  def search
    query = params[:query]
    movies = MovieGateway.movie_search(query)
    render json: MovieSerializer.format_movie_list(movies)
  end
end