class ViewingParty < ApplicationRecord
  belongs_to :host, class_name: 'User'
  has_many :viewing_party_attendees
  has_many :invitees, through: :viewing_party_invitees

  validates :name, :start_time, :end_time, :movie_id, :movie_title, presence: true
end
