class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: :search_results

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def search_results
    if params[:query].present?
      @movies = Movie.where("title ILIKE ?", "%#{params[:query]}%")
      @playlist = Playlist.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @movies = Movie.all
    end
  end
end
