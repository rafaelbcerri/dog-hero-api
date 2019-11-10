class UsersController < ApplicationController
  before_action :authenticate_user!

  def get_dogs
    resource = Dog
      .joins(:user)
      .where(:users => { id:  params[:id] })

    render json: resource
  end

  def get_pet_owner_dog_walkings
    dog_walkings = DogWalking
      .joins(:dogs)
      .where(:dogs => { user_id:  params[:id] })
      .group(:id)

    render json: dog_walkings,
           include: [:dogs, :dog_walking_status, :user]
  end

  def get_walker_dog_walkings
    dog_walkings = DogWalking
      .where(user_id: params[:id])

    render json: dog_walkings,
           include: [:dogs, :dog_walking_status, :user]
  end
end
