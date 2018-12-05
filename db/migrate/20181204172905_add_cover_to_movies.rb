class AddCoverToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :cover, :string
  end
end
