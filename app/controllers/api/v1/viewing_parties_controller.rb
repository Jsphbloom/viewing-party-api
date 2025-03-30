class Api::V1::ViewingPartiesController < ApplicationController
  def create
    party = ViewingParty.new(viewing_party_params)
    party.host_id = params[:host_id]

    if party.save
      create_invitees(party, params[:invitees])
      render json: ViewingPartySerializer.new(party)
    else
      render json: { errors: party.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def viewing_party_params
    params.permit(:name, :start_time, :end_time, :movie_id, :movie_title, :host_id)
  end

  def create_invitees(party, invitees)
    invitees.each do |invitee|
      user = User.find_by(id: invitee)
      party.viewing_party_invitees.create(user: user) if user
    end
  end
end
