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
          amount: @listing.price*100,
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
      begin
        # Create customer if neeeded
        if current_user.stripe_cust_id.nil?
          customer = Stripe::Customer.create(
            :email => params[:stripeEmail],
          )
          # Save stripe customer id
          current_user.stripe_cust_id = customer.id
          current_user.save
        end
        # Update source
        customer = Stripe::Customer.retrieve(current_user.stripe_cust_id)
        customer.source = params[:stripeToken]
        customer.save
  
        # Create stripe charge for given date range
        charge = Stripe::Charge.create(
          :customer    => current_user.stripe_cust_id,
          :amount      => @amount,
          :description => "deposit for listing id: #{@listing.id}",
          :currency    => 'aud'
        )
        # Create deposit
        @deposit = Deposit.new(deposit_params)
        @deposit.user_id = current_user.id
        @deposit.listing_id = @listing.id
        @deposit.deposit_date = Date.today

        # Check if successfully saves to database
        if @deposit.save
          redirect_to deposits_path, notice: 'deposit was successfully created.'
        else
          redirect_to new_listing_deposit_path(@listing), alert: 'deposit failed.'
        end
  
      rescue Stripe::CardError => e
        redirect_to new_listing_deposit_path(@listing), alert: e.message
      end
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