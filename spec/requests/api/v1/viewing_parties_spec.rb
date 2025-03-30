require 'rails_helper'

RSpec.describe "ViewingParties", type: :request do
  describe "POST a viewing party" do
    it "can create a viewing party" do
      create(:user, id: 3)
      create(:user, id: 5)
      create(:user, id: 11)
      create(:user, id: 7)

      party = create(:viewing_party)

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

    end
  end
end
