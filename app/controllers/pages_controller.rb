class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # THRILLER MOVIES
    @thriller_categories = Category.where("name ILIKE ?", "%thriller%")
    @thriller_movies = Movie.joins(:movie_categories).
      where(movie_categories: { category_id: @thriller_categories.pluck(:id) }).
      limit(4)
    # ROMANCE MOVIES
    @romance_categories = Category.where("name ILIKE ?", "%romance%")
    @romance_movies = Movie.joins(:movie_categories).
      where(movie_categories: { category_id: @romance_categories.pluck(:id) }).
      limit(4)
    # DRAMA MOVIES
    @drama_categories = Category.where("name ILIKE ?", "%drama%")
    @drama_movies = Movie.joins(:movie_categories).
      where(movie_categories: { category_id: @drama_categories.pluck(:id) }).
      limit(4)
    # ADVENTURE MOVIES
    @adventure_categories = Category.where("name ILIKE ?", "%adventure%")
    @adventure_movies = Movie.joins(:movie_categories).
      where(movie_categories: { category_id: @adventure_categories.pluck(:id) }).
      limit(4)
  end
end
