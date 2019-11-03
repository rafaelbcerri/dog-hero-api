class UsersController < ApplicationController

  def update
    user = User.find_by_id(params[:id])

    user.name = update_params['name'] if update_params['name']
    user.img = update_params['img'] if update_params['img']

    puts update_params.inspect
    if (update_params['dogs'])
      Dog.create(update_params['dogs']) do |dog|
        puts dog
        dog.user = user
      end
    end

    user.save
    render_resource(user)
  end

  private

  def update_params
    params.permit(:name, :img, :dogs => [:name, :age])
  end

end
