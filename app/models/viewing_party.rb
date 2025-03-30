class ViewingParty < ApplicationRecord
  belongs_to :host, class_name: 'User', foreign_key: 'host_id'
  has_many :viewing_party_invitees
  has_many :invitees, through: :viewing_party_invitees, source: :user

  validates :name, :start_time, :end_time, :movie_id, :movie_title, presence: true
end
