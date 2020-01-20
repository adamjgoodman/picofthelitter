class AddBreedsToGrams < ActiveRecord::Migration[5.2]
  def change
    add_column :grams, :breed, :string
  end
end
