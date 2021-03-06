class MoviesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :search_results

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @categories = @movie.categories.order(:name)
    @user = current_user
    @playlists = @user.created_playlists
    @watchlist_item = @user.watchlist_items.find { |wi| wi.movie == @movie }
    @order = Order.create!(movie: @movie, amount: @movie.price, state: 'pending', user: current_user)

  end

  def search_results
  end

  def watch
    @movie = Movie.find(params[:id])
  end
end
