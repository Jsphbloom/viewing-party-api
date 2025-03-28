class MovieGateway

  def self.popular_movies
    response = conn.get("/3/movie/popular")
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  private

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org") do |f|
      f.headers['Authorization'] = "Bearer #{Rails.application.credentials.tmdb[:key]}"
      f.headers['Content-Type'] = 'application/json'
    end
  end
end