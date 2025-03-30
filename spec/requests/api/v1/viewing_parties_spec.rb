require 'rails_helper'

RSpec.describe "ViewingParties", type: :request do
  describe "POST a viewing party" do
    it "can create a viewing party" do
      @host = create(:user, id: 3)
      @user1 = create(:user, id: 5)
      @user2 = create(:user, id: 11)
      @user3 = create(:user, id: 7)

      party = create(:viewing_party, invitees: [@user1, @user2, @user3])

      headers = {"CONTENT_TYPE" => "application/json"}

      params = {
        name: party.name,
        start_time: party.start_time,
        end_time: party.end_time,
        movie_id: party.movie_id,
        movie_title: party.movie_title,
        host_id: party.host.id,
        invitees: party.invitees.map(&:id)
      }


      post "/api/v1/viewing_parties", headers: headers, params: JSON.generate(params)
      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data][:type]).to eq("viewing_party")
      expect(json[:data][:id]).to be_a(String)
      expect(json[:data][:attributes]).to have_key(:movie_title)
      expect(json[:data][:attributes]).to have_key(:name)
      expect(json[:data][:attributes][:invitees][0]).to be_a(Hash)
      expect(json[:data][:attributes][:invitees][0][:id]).to eq(5)
      expect(json[:data][:attributes][:host_id]).to eq(@host.id)

    end
  end
end
