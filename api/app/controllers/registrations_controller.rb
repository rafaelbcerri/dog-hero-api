class RegistrationsController < Devise::RegistrationsController
  wrap_parameters :user, include: [:name, :email, :password]
  respond_to :json

  def create
    build_resource(sign_up_params)

    resource.role = Role.find_by_name(params['role']) if params['role']

    resource.save
    render_resource(resource)
  end
end
