module Api::V1
    class StateIdsController < ApiController
        # GET /v1/users
    def index
        user = User.find(params[:user_id])
        render json: user.state_ids.all
      end
  
      # GET /users/1
      def show
        state_id = StateId.find(params[:id])
        render json: state_id, serializer: StateIdSerializer, status: :ok
      end

      # PATCH/PUT /users/1
      def update
        state_id = StateId.find(params[:id])
          if state_id.update(state_id_params)
            render json: state_id, serializer: StateIdSerializer, status: :ok
          else
            render json: { errors: state_id.errors.full_messages}.to_json, status: :unprocessable_entity
          end
      end
  
      def create
        state_id = StateId.new(state_id_params.merge(user_id: params[:user_id]))
        if state_id.save
          render json: state_id, serializer: StateIdSerializer, status: :ok
        else
          render json: { errors: state_id.errors.full_messages}.to_json, status: :unprocessable_entity
        end
      end
  
      # DELETE /users/1
      def destroy
        state_id = StateId.find(params[:id])
        state_id.destroy
        render json: {message: "State ID deleted!"}.to_json, status: :ok
      end
  
    protected
  
    # Only allow a trusted parameter "white list" through.
      def state_id_params
        params.require(:state_id).permit(:number, :state, :expiration_date, :image)
      end
    end
end