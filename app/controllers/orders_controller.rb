class OrdersController < ApplicationController
    def buy
        Stripe.api_key = "#{ENV['STRIPE_API_KEY']}"

        listing = Listing.find(params[:listing_id])

        line_item = {
            price_data: {
              currency: 'aud',
              product_data: {
                name: listing.title
              },
              unit_amount: listing.price
            },
            quantity: 1
          }

        session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [line_item],
            mode: 'payment',
            # These placeholder URLs will be replaced in a following step.
            success_url: success_url,
            cancel_url: cancel_url
          })

        redirect_to session.url
    end

    def success
        # reduce qty on the listing by qty bought
        
    end

    def cancel
    end
end
