class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    user = User.find_by_id(params[:id])

    user.name = update_params['name'] if update_params['name']
    user.img = update_params['img'] if update_params['img']

    if (update_params['dogs'])
      Dog.create(update_params['dogs']) do |dog|
        dog.user = user
      end
    end

    user.save
    render_resource(user)
  end

  def get_dog_walkings
    dog_walkings = DogWalking
      .joins(:dogs)
      .where(:dogs => { user_id:  params[:id] })
      .group(:id)

    render json: dog_walkings,
           include: [:dogs, :dog_walking_status, :user]
  end

  private

  def update_params
    params.permit(:name, :img, :dogs => [:name, :age])
  end

end
