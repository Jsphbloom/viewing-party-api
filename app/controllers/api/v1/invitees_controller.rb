class Api::V1::InviteesController < ApplicationController

  def create

    party = ViewingParty.find_by(id: params[:viewing_party_id])
    return render json: { errors: ['Invalid viewing party ID'] }, status: :not_found unless party

    invitee = User.find_by(id: params[:invitees_user_id])
    return render json: { errors: ['Invalid user ID'] }, status: :not_found unless invitee

    party.viewing_party_invitees.create(user: invitee)

    render json: ViewingPartySerializer.new(party)
  end
end