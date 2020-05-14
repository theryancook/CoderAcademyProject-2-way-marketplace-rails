class RemoveIntegerFromListings < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :integer, :integer
  end
end
