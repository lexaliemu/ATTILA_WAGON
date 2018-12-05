class RemoveCoverFromMovies < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :cover, :string
  end
end
