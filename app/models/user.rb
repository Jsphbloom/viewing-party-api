class User < ApplicationRecord
  has_many :hosted_parties, class_name: 'ViewingParty', foreign_key: 'host_id'
  has_many :viewing_party_invitees
  has_many :viewing_parties, through: :viewing_party_invitees

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: { require: true }
  has_secure_password
  has_secure_token :api_key

end