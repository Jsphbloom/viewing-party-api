class MovieSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :vote_average

  def self.format_movie_list(movies)
    { data:
        movies.map do |movie|
          {
            id: movie[:id],
            type: "movie",
            attributes: {
              title: movie[:title],
              vote_average: movie[:vote_average]
            }
          }
        end
  }
  end

  def self.format_single_movie(movie)
    { data:
          {
            id: movie.id,
            type: "movie",
            attributes: {
              title: movie.title,
              vote_average: movie.vote_average
            }
          }
        }
  end
end