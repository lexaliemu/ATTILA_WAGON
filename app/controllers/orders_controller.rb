class OrdersController < ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    order = Order.create!(movie: movie, amount: movie.price, state: 'pending', user: current_user)

    redirect_to new_order_payment_path(order)
  end

  def show
    @order = Order.find(params[:id])
  end
end
