module Api::V1
    class MedicalRecommendationsController < ApiController
        # GET /v1/users
    def index
        user = User.find(params[:user_id])
        render json: user.medical_recommendations.all
      end
  
      # GET /users/1
      def show
        medical_recommendation = MedicalRecommendation.find(params[:id])
        render json: medical_recommendation, serializer: MedicalRecommendationSerializer, status: :ok
      end
  
      def create
        medical_recommendation = MedicalRecommendation.new(medical_recommendation_params.merge(user_id: params[:user_id]))
        if medical_recommendation.save
          render json: medical_recommendation, serializer: MedicalRecommendationSerializer, status: :ok
        else
          render json: { errors: medical_recommendation.errors.full_messages}.to_json, status: :unprocessable_entity
        end
      end

    # PATCH/PUT /users/1
      def update
        medical_recommendation = MedicalRecommendation.find(params[:id])
          if medical_recommendation.update(medical_recommendation_params)
            render json: medical_recommendation, serializer: MedicalRecommendationSerializer, status: :ok
          else
            render json: { errors: medical_recommendation.errors.full_messages}.to_json, status: :unprocessable_entity
          end
      end

      # DELETE /users/1
      def destroy
        medical_recommendation = MedicalRecommendation.find(params[:id])
        medical_recommendation.destroy
        render json: {message: "Medical Recommendation deleted!"}.to_json, status: :ok
      end
  
    protected
  
    # Only allow a trusted parameter "white list" through.
      def medical_recommendation_params
        params.require(:medical_recommendation).permit(:number, :issuer, :state, :expiration_date, :image)
      end
    end
end