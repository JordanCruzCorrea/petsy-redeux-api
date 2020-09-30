class ApplicationController < ActionController::API
  SECRET_KEY = Rails.application.secrets.secret_key_to_base.to_s

  # The token is encoded and decoded with the built in Rails secret key. It also requires an expiration time
  def encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end

  # authorize_request method first grabs the auth header
  def authorize_request
    header = request.headers['Authorization']

    # splits out the token from the header
    header = header.split(' ').last if header
    begin
      # use our decode helper method to pull the user info from the token
      @decoded = decode(header)

      # set an instance variable @current_user using the user_id from the token data
      @current_user = User.find(@decoded[:id])

    # If the user can't be found or the token isn't valid, we raise an unauthorized error
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
