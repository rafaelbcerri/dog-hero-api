class DogWalking < ApplicationRecord
  has_and_belongs_to_many :dogs
  belongs_to :dog_walking_status
  belongs_to :user, optional: true
end
