class AuthenticationController < ApplicationController

  def authenticate
    user = User.find_for_database_authentication(email: params[:email])
    if user && user.valid_password?(params[:password])
      render json: payload(user)
    else
      # render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
      render json: {
        "errors": [
          {
            "detail": "Invalid Username/Password",
            "source": {
              "pointer": "data/attributes/login"
            }
          }
        ]
      }, status: :unauthorized
    end
  end

  private

  def payload(user)
    return nil unless user and user.id
    {
      token: JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, email: user.email}
    }
  end
end
