class AddSalesCountToListings < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :sales_count, :integer, null: false, default: 0
  end
end
