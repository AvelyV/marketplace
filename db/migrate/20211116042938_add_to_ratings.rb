class AddToRatings < ActiveRecord::Migration[6.1]
  def change
    add_index :ratings, [:rating_giver_id, :rating_receiver_id], unique: true
  end
end
