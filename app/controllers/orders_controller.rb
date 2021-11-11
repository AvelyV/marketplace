class OrdersController < ApplicationController
    def buy
        Stripe.api_key = "#{ENV['STRIPE_API_KEY']}"

        line_item = {
            price_data: {
              currency: 'aud',
              product_data: {
                name: 'T-shirt'
              },
              unit_amount: 2000
            },
            quantity: 1
          }
          
        session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
              price_data: {
                currency: 'aud',
                product_data: {
                  name: 'T-shirt'
                },
                unit_amount: 2000
              },
              quantity: 1
            }],
            mode: 'payment',
            # These placeholder URLs will be replaced in a following step.
            success_url: success_url,
            cancel_url: cancel_url
          })

        redirect_to session.url
    end

    def success

    end

    def cancel
    end
end
