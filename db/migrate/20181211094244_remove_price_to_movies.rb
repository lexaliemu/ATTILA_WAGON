class RemovePriceToMovies < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :price
  end
end
