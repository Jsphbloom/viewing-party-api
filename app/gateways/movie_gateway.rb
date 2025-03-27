class MovieGateway


  private

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org") do |f|
      f.headers['Authorization'] = "Bearer #{ENV['API_ACCESS_TOKEN']}"
      f.headers['Content-Type'] = 'application/json'
    end
  end
end