class CreateStateIds < ActiveRecord::Migration[5.2]
  def change
    create_table :state_ids do |t|
      t.references :user
      t.integer :number
      t.string :state
      t.date :expiration_date
      t.string :image

      t.timestamps
    end
    
    remove_column(:users, :state_id_number)
    remove_column(:users, :state_id_state)
    remove_column(:users, :state_id_expiration_date)
    remove_column(:users, :state_id_image)

  end
end
