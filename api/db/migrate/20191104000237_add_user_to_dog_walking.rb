class AddUserToDogWalking < ActiveRecord::Migration[5.2]
  def change
    add_reference :dog_walkings, :user, foreign_key: true
  end
end
