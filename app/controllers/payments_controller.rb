class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [ :webhook ]

  def success
    @listing = Listing.find(params[:listingId])
    @user = Listing.find(params[:listingId])
  end

  def webhook
    deposit_id = params[:data] [:object] [:payment_intent]
    deposit = Stripe::PaymentIntent.retrieve( deposit_id )

    listing_id = deposit.metadata.listing_id
    user_id = deposit.metadata.user_id
    
    p "listing id = " + listing_id
    p "user id = " + user_id

    status 200

  end

end