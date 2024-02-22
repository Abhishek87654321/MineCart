class CheckoutController < ApplicationController
    def process_payment
      
      token = params[:stripeToken]
      charge = Stripe::Charge.create(
        amount: @cart.total_price_in_cents,
        currency: 'usd',
        description: 'Example charge',
        source: token
      )
  
      
      flash[:notice] = 'Payment successful!'
      redirect_to root_path
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to root_path
    end
  end