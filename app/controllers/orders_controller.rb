class OrdersController < ApplicationController
  def buy
    Stripe.api_key = (ENV['STRIPE_API_KEY']).to_s

    # find the record in listings tabel that matches id passed in in parameters
    listing_in = Listing.find(params[:listing_id])

    line_item = {
      price_data: {
        currency: 'aud',
        product_data: {
          name: listing_in.title
        },
        unit_amount: (listing_in.price * 100).to_i
      },
      quantity: 1
    }

    session = Stripe::Checkout::Session.create({
                                                 payment_method_types: ['card'],
                                                 line_items: [line_item],
                                                 mode: 'payment',
                                                 # These placeholder URLs will be replaced in a following step.
                                                 success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
                                                 cancel_url: cancel_url + "?session_id={CHECKOUT_SESSION_ID}",
                                                 client_reference_id: listing_in.id
                                               })
    # respond_to do |format|
    #     format.js
    # end1)

    redirect_to session.url
  end

  def success
    session = Stripe::Checkout::Session.retrieve("#{params[:session_id]}")
    # reduce qty on the listing by qty bought
    if params[:session_id].present?
      p params
      @listing = Listing.find_by(id: session[:client_reference_id])
      @listing.decrement!(:qty, 1)
      redirect_to listings_path, notice: "Payment Seccessful"
    else
      redirect_to cancel_url
    end
  end

  def cancel
    redirect_to listings_path, alert: "Cancelled"
  end
end
