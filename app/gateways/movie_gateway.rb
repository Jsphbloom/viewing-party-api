class MovieGateway

  def self.top_rated_movies
    response = conn.get("/3/movie/top_rated") do |request|
      request.params["page"] = 1
    end
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def self.movie_search(query)
    response = conn.get("/3/search/movie") do |request|
      request.params["query"] = query.to_s.strip
      request.params["page"] = 1
    end
    JSON.parse(response.body, symbolize_names: true)[:results] || []
  end

  def self.movie_details(id)
    response_details = JSON.parse(conn.get("/3/movie/#{id}").body, symbolize_names: true)
    response_credits = JSON.parse(conn.get("/3/movie/#{id}/credits").body, symbolize_names: true)
    response_reviews = JSON.parse(conn.get("/3/movie/#{id}/reviews").body, symbolize_names: true)

    if response_details[:success] == false
      return { error: response_details[:status_message] }
    end
    
    { details: response_details, credits: response_credits, reviews: response_reviews }
  end

  private

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org") do |f|
      f.headers['Authorization'] = "Bearer #{Rails.application.credentials.tmdb[:access_token]}"
      f.headers['Content-Type'] = 'application/json'
    end
  end
end