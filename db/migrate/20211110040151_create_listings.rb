class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :price
      t.integer :qty

      t.timestamps
    end
  end
end
