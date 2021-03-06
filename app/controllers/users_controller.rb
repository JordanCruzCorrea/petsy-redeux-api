class UsersController < ApplicationController
  def user_items
    @user = User.find(params[:id])

    render json: @user, include: :items, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      @token = encode({ id: @user.id })
      render json: {
        # .except removes password_digest from being sent to front end
        user: @user.attributes.except('password_digest'),
        token: @token
      }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # Bcrypt will take a password and create a password_digest
    # UsersController needs to permit a :password instead of a :password_digest
    def user_params
      params.require(:user).permit(:username, :email, :password, :picture)
    end
end
