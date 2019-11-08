class CreateJoinTableDogWalkingsDogs < ActiveRecord::Migration[5.2]
  def change
    create_join_table :dog_walkings, :dogs do |t|
      t.index [:dog_walking_id, :dog_id]
      t.index [:dog_id, :dog_walking_id]
    end
  end
end
