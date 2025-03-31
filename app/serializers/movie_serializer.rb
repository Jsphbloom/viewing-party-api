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
    return { error: movie[:error] } if movie[:error]
    { 
      data:
          {
            id: movie[:details][:id],
            type: "movie",
            attributes: {
              title: movie[:details][:title],
              release_year: movie[:details][:release_date],
              vote_average: movie[:details][:vote_average],
              runtime: movie[:details][:runtime],
              genres: movie[:details][:genres],
              summary: movie[:details][:overview],
              cast: movie[:credits][:cast].first(10).map do |actor|
                { 
                  character: actor[:character],
                  actor: actor[:name]
                }
              end,
              total_reviews: movie[:reviews][:total_results],
              reviews: movie[:reviews][:results].first(5).map do |review|
                { 
                  author: review[:author],
                  review: review[:content]
                }
              end
            }
          }
      }
  end
end