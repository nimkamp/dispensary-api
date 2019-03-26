class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :dob, :state_id_number, :state_id_state, :state_id_expiration_date, :state_id_image
end
