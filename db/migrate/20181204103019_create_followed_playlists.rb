class CreateFollowedPlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :followed_playlists do |t|
      t.references :user, foreign_key: true
      t.references :playlist, foreign_key: true
      t.timestamps
    end
  end
end
