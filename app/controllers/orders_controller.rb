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
        # respond_to do |format|
        #     format.js
        # end
        redirect_to session.url
    end

    def success
        # reduce qty on the listing by qty bought
        if params[:session_id].present? 
            # session.delete(:cart)
            session[:order] = [] # empty cart = empty array
            @session_with_expand = Stripe::Checkout::Session.retrieve({ id: params[:session_id], expand: ["line_items"]})
            @session_with_expand.line_items.data.each do |line_item|
              @listing = Listing.find_by(stripe_product_id: line_item.price.listing)
              @listing.update(sales_count: @listing.sales_count += 1)
              @listing.increment!(:sales_count)

              raise
            end
          
          # else
          #   redirect_to cancel_url
          end
        
        redirect_to listings_path, notice: "Payment Seccessful"
    end

    def cancel
      redirect_to listings_path, alert: "Something went wrong, try again"
    end
end
