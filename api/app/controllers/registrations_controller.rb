class RegistrationsController < Devise::RegistrationsController
  wrap_parameters :user, include: [:name, :email, :password]
  respond_to :json

  def create
    build_resource(sign_up_params)

    resource.save
    render_resource(resource)
  end
end
