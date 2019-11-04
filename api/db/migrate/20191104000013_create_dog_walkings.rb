class CreateDogWalkings < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_walkings do |t|
      t.integer :duration
      t.string :latitude
      t.string :longitude
      t.datetime :begin_date
      t.datetime :end_date
      t.string :status
      t.datetime :scheduled_date
      t.float :price

      t.timestamps
    end
  end
end
