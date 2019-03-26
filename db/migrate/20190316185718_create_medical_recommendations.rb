class CreateMedicalRecommendations < ActiveRecord::Migration[5.2]
  def change
    create_table :medical_recommendations do |t|
      t.references :user
      t.integer :number
      t.string :issuer
      t.string :state
      t.date :expiration_date
      t.string :image

      t.timestamps
    end

    remove_column(:users, :medical_recommendation_number)
    remove_column(:users, :medical_recommendation_issuer)
    remove_column(:users, :medical_recommendation_state)
    remove_column(:users, :medical_recommendation_expiration_date)
    remove_column(:users, :medical_recommendation_image)
    
  end
end
