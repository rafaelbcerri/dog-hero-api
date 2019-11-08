class Dog < ApplicationRecord
  has_and_belongs_to_many :dog_walkings
  belongs_to :user
end
