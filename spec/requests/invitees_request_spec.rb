require "rails_helper"

RSpec.describe "invitees_controller", :request do
  describe "add a user to an existing viewing party" do
    it "returns 200 OK and provides expected fields" do
      @host = create(:user, id: 3)
      @user1 = create(:user, id: 5)
      @user2 = create(:user, id: 11)
      @user3 = create(:user, id: 7)
      @addeduser = create(:user, id: 15)
      party = create(:viewing_party, id: 1, invitees: [@user1, @user2, @user3])

      headers = {"CONTENT_TYPE" => "application/json"}

      params = {
        invitees_user_id: 15
      }

      post "/api/v1/viewing_parties/1/invitees", headers: headers, params: JSON.generate(params)
      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data][:type]).to eq("viewing_party")
      expect(json[:data][:id]).to be_a(String)
      expect(json[:data][:attributes]).to have_key(:movie_title)
      expect(json[:data][:attributes]).to have_key(:name)
      expect(json[:data][:attributes][:invitees][0]).to be_a(Hash)
      expect(json[:data][:attributes][:invitees][0][:id]).to eq(5)
      expect(json[:data][:attributes][:invitees][3][:id]).to eq(15)
      expect(json[:data][:attributes][:host_id]).to eq(@host.id)
    end
  end
end