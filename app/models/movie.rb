class Movie < ApplicationRecord
  validates :id, presence: true, uniqueness: true
end