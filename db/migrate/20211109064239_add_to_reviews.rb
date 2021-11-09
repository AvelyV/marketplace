class AddToReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :ratings, :rating_receiver, foreign_key: { to_table: :users }
    add_reference :ratings, :rating_giver, foreign_key: { to_table: :users }
  end
end
