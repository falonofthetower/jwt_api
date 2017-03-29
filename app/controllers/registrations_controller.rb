class RegistrationsController < Devise::RegistrationsController
  include JSONAPI::ActsAsResourceController

  def create
    user = User.create(user_params)
    data = { "data": [{ "type": "users", "id": "#{user.id}" }] }
    render json: data
  end

  private

  def user_params
    params[:data]["attributes"].transform_keys!(&:underscore)
    params["data"].require(:attributes).permit(:email, :password, :password_confirmation)
  end

  def password_confirmation
    serialization_options[:password_confirmation]
  end
end
