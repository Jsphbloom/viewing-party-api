class Api::V1::MoviesController < ApplicationController

  def index
    if params[:query].present?
      movies = MovieGateway.movie_search(params[:query])
    else
      movies = MovieGateway.top_rated_movies
    end
  
    render json: MovieSerializer.format_movie_list(movies)
  end
end