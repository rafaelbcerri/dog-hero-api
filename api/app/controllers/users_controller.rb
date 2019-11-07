class UsersController < ApplicationController
  before_action :authenticate_user!

  def get_dog_walkings
    dog_walkings = DogWalking
      .joins(:dogs)
      .where(:dogs => { user_id:  params[:id] })
      .group(:id)

    render json: dog_walkings,
           include: [:dogs, :dog_walking_status, :user]
  end
end
