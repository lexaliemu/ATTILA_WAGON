class CreateMoviePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_playlists do |t|
      t.references :movie, foreign_key: true
      t.references :playlist, foreign_key: true
      t.timestamps
    end
  end
end
