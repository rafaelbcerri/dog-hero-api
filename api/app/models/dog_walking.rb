class DogWalking < ApplicationRecord
  has_and_belongs_to_many :dogs
  belongs_to :dog_walking_status
  belongs_to :user, optional: true

  private

  def calcule_price
    return 0 if self.dogs.nil? || self.duration.nil?

    extra_dogs = self.dogs.length - 1
    if self.duration == 30
      self.price = 25 + (extra_dogs * 15)
    else
      self.price = 35 + (extra_dogs * 20)
    end
  end

  def walk_duration
    return 0 if self.begin_date.nil? || self.end_date.nil?

    # ((self.end_date - self.begin_date) / 1.minutes).round(2)
    (self.end_date.minus_with_coercion(self.begin_date)).round(2) / 1.minutes
    Time.at((self.end_date - self.begin_date).to_i.abs).utc.strftime "%H:%M:%S"
  end
end
