class AddDogWalkingStatusToDogWalking < ActiveRecord::Migration[5.2]
  def change
    add_reference :dog_walkings, :dog_walking_status, foreign_key: true
  end
end
