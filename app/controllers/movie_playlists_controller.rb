class MoviePlaylistsController < ApplicationController

  def create
    @movie = Movie.find(params[:movie_id])
    @playlist = Playlist.find(playlist_id_param)
    @movie_playlist = MoviePlaylist.new(movie: @movie, playlist: @playlist)
    @movie_playlist.save!
    redirect_to movie_path(@movie)
  end

  def destroy
    movie = Movie.find(params[:movie_id])
    playlist = Playlist.find(params[:id])
    @movie_playlist = movie.movie_playlists
    @movie_playlist.each do |x|
      if x.playlist == playlist
        x.destroy
      end
    end
    redirect_to playlist_path(playlist)
  end

  private

  def playlist_id_param
    params.require("@playlist").to_i
  end
end
