class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :username, :api_key

  def self.format_user_list(users)
    { data:
        users.map do |user|
          {
            id: user.id.to_s,
            type: "user",
            attributes: {
              name: user.name,
              username: user.username
            }
          }
        end
    }
  end

  def self.format_single_user(user)
    {
      id: user.id.to_s,
      type: "user",
      attributes: {
        name: user.name,
        username: user.username,
        viewing_parties_hosted: user.hosted_parties.map do |party|
          {
            id: party.id,
          name: party.name,
          start_time: party.start_time.strftime('%Y-%m-%d %H:%M:%S'),
          end_time: party.end_time.strftime('%Y-%m-%d %H:%M:%S'),
          movie_id: party.movie_id,
          movie_title: party.movie_title,
          host_id: party.host_id
          }
        end,
        viewing_parties_invited: user.viewing_parties.map do |party|
          {
          name: party.name,
          start_time: party.start_time.strftime('%Y-%m-%d %H:%M:%S'),
          end_time: party.end_time.strftime('%Y-%m-%d %H:%M:%S'),
          movie_id: party.movie_id,
          movie_title: party.movie_title,
          host_id: party.host_id
          }
        end
      }
    }
  end
end