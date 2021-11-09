class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.text :comment, limit: 500

      t.timestamps
    end
  end
end
