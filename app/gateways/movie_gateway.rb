class MovieGateway

  def self.top_rated_movies
    response = conn.get("/3/movie/top_rated") do |request|
      request.params["page"] = 1
    end
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def self.movie_search(params)
    response = conn.get("/3/discover/movie") do |request|
      params.each { |key, value| request.params[key] = value }
      request.params["page"] = 1
    end
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