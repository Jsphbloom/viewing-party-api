class ViewingPartySerializer
  include JSONAPI::Serializer
  attributes :id, :name, :start_time, :end_time, :movie_id, :movie_title, :host_id, :invitees

    attribute :invitees do |party|
      party.viewing_party_invitees.map do |invitee|
        {
          id: invitee.user.id,
          name: invitee.user.name,
          username: invitee.user.username
        }
    end
  end
end
