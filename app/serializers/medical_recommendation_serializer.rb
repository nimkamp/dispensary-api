class MedicalRecommendationSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :number, :issuer, :state, :expiration_date, :image 
  end
  