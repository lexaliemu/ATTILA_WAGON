class AddColumnToPlaylist < ActiveRecord::Migration[5.2]
  def change
    add_column :playlists, :picture, :string
  end
end
