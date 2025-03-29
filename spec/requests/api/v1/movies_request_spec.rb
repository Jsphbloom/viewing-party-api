require "rails_helper"

RSpec.describe "Movies API", :request do
  describe "Index top rated movies" do
    context "request is valid" do
      it "returns 200 OK and provides expected fields" do
        json_response = File.read('spec/fixtures/movies_query.json')
        stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?page=1").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'Authorization'=>"Bearer #{Rails.application.credentials.tmdb[:key]}",
         'Content-Type'=>'application/json',
         'User-Agent'=>'Faraday v2.10.1'
          }).
        to_return(status: 200, body: json_response, headers: {})

        get "/api/v1/movies"

        expect(response).to have_http_status(:ok)

        json = JSON.parse(response.body, symbolize_names: true)

        expect(json[:data][0][:type]).to eq("movie")
        expect(json[:data][0][:id]).to be_a(Integer)
        expect(json[:data][0][:attributes]).to have_key(:title)
        expect(json[:data][0][:attributes][:vote_average]).to be_a(Float)
      end
    end
  end

  describe "Index movie list with search query" do
    it "returns 200 OK and provides expected fields" do
      json_response = File.read('spec/fixtures/movies_search_query.json')
      stub_request(:get, "https://api.themoviedb.org/3/search/movie?query=TRON:%20Legacy&page=1").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'Authorization'=>"Bearer #{Rails.application.credentials.tmdb[:key]}",
         'Content-Type'=>'application/json',
         'User-Agent'=>'Faraday v2.10.1'
          }).
        to_return(status: 200, body: json_response, headers: {})

        get "/api/v1/movies/search?query=TRON: Legacy", as: :json

        expect(response).to have_http_status(:ok)

        json = JSON.parse(response.body, symbolize_names: true)

        expect(json[:data][0][:type]).to eq("movie")
        expect(json[:data][0][:id]).to be_a(Integer)
        expect(json[:data][0][:attributes]).to have_key(:title)
        expect(json[:data][0][:attributes][:vote_average]).to be_a(Float)
    end
  end
end