# app/controllers/api/v1/users_controller.rb

module Api::V1
  class UsersController < ApiController
    skip_before_action :authenticate, only: :create

    # GET /v1/users
    def index
      render json: User.all
    end

    # GET /users/1
    def show
      user = User.find(params[:id])
      render json: user, serializer: UserSerializer, status: :ok
    end

    # PATCH/PUT /users/1
    def update
      user = User.find(params[:id])
      if user.update(user_params)
        render json: user, serializer: UserSerializer, status: :ok
      else
        render json: { errors: user.errors.full_messages}.to_json, status: :unprocessable_entity
      end
    end

    def create
      user = User.new(user_params)
      if user.save
        render json: user, serializer: UserSerializer, status: :ok
      else
        render json: { errors: user.errors.full_messages}.to_json, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    def destroy
      user = User.find(params[:id])
      user.destroy
      render json: {message: "User deleted!"}.to_json, status: :ok
    end

  protected

  # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :dob, :state_id_number, :state_id_state, :state_id_expiration_date, :state_id_image)
    end
  end
end

