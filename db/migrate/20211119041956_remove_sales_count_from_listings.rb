class RemoveSalesCountFromListings < ActiveRecord::Migration[6.1]
  def change
    remove_column :listings, :sales_count, :integer
  end
end
