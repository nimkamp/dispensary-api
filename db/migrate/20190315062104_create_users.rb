class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.date :dob
      t.integer :state_id_number
      t.string :state_id_state
      t.date :state_id_expiration_date
      t.string :state_id_image
      t.integer :medical_recommendation_number
      t.string :medical_recommendation_issuer
      t.string :medical_recommendation_state
      t.date :medical_recommendation_expiration_date
      t.string :medical_recommendation_image

      t.timestamps
    end
  end
end
