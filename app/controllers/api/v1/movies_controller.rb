class Api::V1::MoviesController < ApplicationController

  def index

    movies = if params.present?
      MovieGateway.movie_search(params)
    else
      MovieGateway.top_rated_movies
    end
    
    render json: MovieSerializer.format_movie_list(movies)
  end
end