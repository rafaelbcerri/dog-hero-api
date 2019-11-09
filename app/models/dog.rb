class Dog < ApplicationRecord
  has_and_belongs_to_many :dog_walkings
  belongs_to :user

  validates :name, presence: true
  validates :age, presence: true
  validates :user, presence: true
end
