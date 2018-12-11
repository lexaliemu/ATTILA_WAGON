class PaymentsController < ApplicationController
    before_action :set_order

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @order.amount_cents,
      description:  "Payment for #{@order.movie.title} for order #{@order.id}",
      currency:     @order.amount.currency
    )

    @order.update(payment: charge.to_json, state: 'paid')
    redirect_to movie_path(@order.movie)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to movie_path(@order.movie)
  end

  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
  end

private

  def set_order
    @order = Order.find(params[:order_id])
  end
end
