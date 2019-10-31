class DepositsController < ApplicationController
    before_action :set_deposit, only: [:show, :edit, :update, :destroy]
  
    # GET /deposits
    # GET /deposits.json
    def index
      @deposits = Deposit.all
    end
  
    # GET /deposits/1
    # GET /deposits/1.json
    def show

    end
  
    # GET /deposits/new
    def new
      @deposit = Deposit.new
      @listing = Listing.find(params[:listing_id])

      session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
          name: @listing.title,
          # image: [@listing.image],
          description: @listing.description,
          amount: @listing.price,
          currency: 'aud',
          quantity: 1
      }],
      payment_intent_data: {
          metadata: {
              user_id: current_user.id,
              listing_id: @listing.id
          }
      },
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@listing.id}",
      cancel_url: "#{root_url}listings"
  )
    @session_id = session.id

    end
  
    # GET /deposits/1/edit
    def edit
    end
  
    # POST /deposits
    # POST /deposits.json
    def create
      @deposit = current_user.deposits.new(deposit_params)
      @deposit = Listing.deposits.new(deposit_params)
    end
  
    # PATCH/PUT /deposits/1
    # PATCH/PUT /deposits/1.json
    def update
    end
  
    # DELETE /deposits/1
    # DELETE /deposits/1.json
    def destroy
      @deposit.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_deposit
        @deposit = Deposit.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def deposit_params
        params.require(:deposit).permit(:user_id, :address, :listing_id, :listing_title, :listing_price)
      end

      def set_user_deposit
      id = params[:id]
      @deposit = current_user.listings.find_by_id( id )

      if @deposit == nil
        redirect_to deposits_path
      else
      if @listing.price == nil
        @listing.price = 0
      end
      end
    end
end