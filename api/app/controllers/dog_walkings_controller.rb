class DogWalkingsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:all]
      dog_walking = DogWalking.all
    else
      dog_walking = DogWalking.without_walker_and_status_created
    end

    paginated_dog_walking = dog_walking.paginate(
      page: params['page'],
      per_page: params['per_page']
    )
    paginate json: paginated_dog_walking
  end

  def create
    dog_walking = DogWalking.new(dog_walking_params)
    dog_walking.dog_walking_status = DogWalkingStatus.find_by_name('created');

    if (params['dogs'])
      dogs = Dog.find(params['dogs'])
      dog_walking.dogs << dogs
    end

    dog_walking.calculate_price

    dog_walking.save
    render json: dog_walking, status: :created
  end

  def show
    dog_walking = DogWalking.find_by_id(params['id'])
    render json: dog_walking,
           include: [:dogs, :dog_walking_status, :user],
           methods: :walk_duration
  end

  def update
    dog_walking = DogWalking.find_by_id(params['id'])
    dog_walking.user = User.find_by_id(params['walker_id']) if params['walker_id']
    dog_walking.dog_walking_status = DogWalkingStatus.find_by_name('scheduled')
    dog_walking.save
    render json: dog_walking
  end

  def destroy
    DogWalking.find_by_id(params['id']).destroy
    render status: 204
  end

  def start_walk
    dog_walking = DogWalking.find(params['dog_walking_id'])
    dog_walking.dog_walking_status = DogWalkingStatus.find_by_name('in_progress')
    dog_walking.begin_date = Time.now
    dog_walking.save
    render json: dog_walking
  end

  def finish_walk
    dog_walking = DogWalking.find(params['dog_walking_id'])
    dog_walking.dog_walking_status = DogWalkingStatus.find_by_name('done')
    dog_walking.end_date = Time.now
    dog_walking.save
    render json: dog_walking
  end

  private

  def dog_walking_params
    params.require(:dog_walking).permit(
      :duration,
      :latitude,
      :longitude,
      :scheduled_date,
    )
  end
end
