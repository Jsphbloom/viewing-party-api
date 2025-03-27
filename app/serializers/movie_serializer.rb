class MovieSerializer
  include JSONAPI::Serializer
  attributes :adult, :backdrop_path, :genre_ids, :id, :original_language, :original_title, :overview, :popularity, :poster_path, :release_date, :title, :video, :vote_average, :vote_count

  def self.format_movie_list(movies)
    { data:
        movies.map do |movie|
          {
            id: movie.id,
            type: "movie",
            attributes: {
              title: movie.title,
              vote_average: movie.vote_average
            }
          }
        end
  }
  end
end