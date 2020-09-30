class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    # find the user based on the provided username
    @user = User.find_by(username: login_params[:username])

    # use the Bcrypt helper method .authenticate to verify that the provided password
    # matches the encoded password_digest from our database for our user
    if @user.authenticate(login_params[:password])
      # use our encode method to create a token with the user's id and username inside the token
      @token = encode({ id: @user.id })
      render json: {
        user: @user.attributes.except('password_digest'),
        token: @token
      }, status: :ok
    else
      render json: { errors: 'unauthorized' }, status: :unauthorized
    end
  end

  def verify
    render json: @current_user.attributes.except('password_digest'), status: :ok
  end

  private
  def login_params
    params.require(:authentication).permit(:username, :password)
  end
end
