class MovieGateway

  def self.top_rated_movies
    response = conn.get("/3/movie/top_rated")
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