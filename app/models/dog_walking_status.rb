class DogWalkingStatus < ApplicationRecord
  has_many :dog_walkings

  validates :name, presence: true, uniqueness: true
end
