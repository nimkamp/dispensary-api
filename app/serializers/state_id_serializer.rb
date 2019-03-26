class StateIdSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :number, :state, :expiration_date, :image 
  end