class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :model
      t.text :description
      t.references :size, foreign_key: true
      t.string :price
      t.string :integer
      t.string :location
      t.integer :postcode
      t.date :availability

      t.timestamps
    end
  end
end
