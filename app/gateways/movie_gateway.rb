class MovieGateway


  private

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org") do |f|
      f.headers['Authorization'] = Rails.application.credentials.tmdb[:key]
      f.headers['Content-Type'] = 'application/json'
    end
  end
end