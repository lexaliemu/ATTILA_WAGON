class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: :search_results

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @categories = @movie.categories.order(:name)
  end

  def search_results
  end
end
