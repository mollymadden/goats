class DepositsController < ApplicationController
  before_action :set_deposit, only: [:show, :edit, :update, :destroy]

  # GET /deposits
  # GET /deposits.json
  def index
    # Eager load listing, owner and reviews to allow for title and name and review links in view
    @deposits = Deposit.where(user_id: current_user.id).includes(listing: :user)
    # Get current user's listings ids to allow deposit retrieval
    listing_ids = Listing.where(user_id: current_user.id).pluck(:id)
    # Eager load listing and user to allow for title and name in view
    @lister_deposits = Deposit.where(listing_id: listing_ids).includes(:listing, :user)
  end

  # GET /deposits/1
  # GET /deposits/1.json
  def show
  end

  # GET /deposits/new
  def new
    @deposit = Deposit.new
    @listing = Listing.find(params[:listing_id])
    @deposit.listing = @listing
    @amount = @listing.price

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
          name: @listing.title,
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
      success_url: "#{root_url}deposits/success?userId=#{current_user.id}&listingId=#{@listing.id}",
      cancel_url: "#{root_url}listings"
  )
    @session_id = session.id
  end

  # GET /deposits/1/edit
  def edit
  end




  def create

    @deposit = Deposit.new(deposit_params)
    @deposit.user_id = current_user.id
    @deposit.listing_id = @listing.id
    @deposit.deposit_date = Date.today

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

      @deposit.stripe_charge_id = charge.id
      # Create deposit
 


      # Check if successfully saves to database
      if @deposit.save
        redirect_to deposits_path, notice: 'deposit was successfully created.'
      else
        redirect_to new_deposit_path(@listing), alert: 'deposit failed.'
      end

    rescue Stripe::CardError => e
      redirect_to new_deposit_path(@listing), alert: e.message
  end

  # PATCH/PUT /deposits/1
  # PATCH/PUT /deposits/1.json
  def update
    respond_to do |format|
      if @deposit.update(deposit_params)
        format.html { redirect_to @deposit, notice: 'deposit was successfully updated.' }
        format.json { render :show, status: :ok, location: @deposit }
      else
        format.html { render :edit }
        format.json { render json: @deposit.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /deposits/1
  # DELETE /deposits/1.json
  def destroy
    @deposit.destroy
    respond_to do |format|
      format.html { redirect_to deposits_url, notice: 'deposit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_deposit
      @deposit = Deposit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deposit_params
        params.require(:deposit).permit(:user_id, :address, :listing_id, :listing_title, :listing_price, :stripe_charge_id)
    end  
  end
