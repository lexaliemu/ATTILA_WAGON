class AddPriceToMovies < ActiveRecord::Migration[5.2]
  def change
    add_monetize :movies, :price, currency: { present: false }
  end
end
