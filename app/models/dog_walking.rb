class DogWalking < ApplicationRecord
  has_and_belongs_to_many :dogs
  belongs_to :dog_walking_status
  belongs_to :user, optional: true

  scope :without_walker_and_status_created, -> {
    where(user_id: nil, dog_walking_status_id: 1)
  }

  validates :duration, presence: true
  validates :latitude, presence: true
  validates :latitude, presence: true
  validates :scheduled_date, presence: true
  validates :dog_walking_status_id, presence: true
  validates :price, presence: true
  validates :dogs, presence: true

  def calculate_price
    return 0 if self.dogs.nil? || self.duration.nil?

    extra_dogs = self.dogs.length - 1
    if self.duration == 30
      self.price = 25 + (extra_dogs * 15)
    else
      self.price = 35 + (extra_dogs * 20)
    end
  end

  def walk_duration
    return '00:00:00' if self.begin_date.nil? || self.end_date.nil?

    time_difference = self.end_date - self.begin_date
    Time.at(time_difference.to_i.abs).utc.strftime '%H:%M:%S'
  end
end
