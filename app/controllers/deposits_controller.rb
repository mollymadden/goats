class DepositsController < ApplicationController
  before_action :set_deposit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!  


  def index
    @deposits = Deposit.where(user_id: current_user.id).includes(listing: :user)
  end

  def new
    @deposit = Deposit.new
    @listing = Listing.find(params[:listing_id])

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      customer_address: @deposit.address,
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
              listing_id: @listing.id,
              customer_address: @deposit.address,
          }
      },
      success_url: "#{root_url}deposits/success?user_id=#{current_user.id}&listing_id=#{@listing.id}&amount=#{@listing.price}",
      cancel_url: "#{root_url}listings"
    )
    @session_id = session.id
  end




  def create
    @deposit = Deposit.new(deposit_params)
    if @deposit.save
      redirect_to deposits_confirmation_path(deposit: @deposit)
    end
  end

  def confirmation
    @deposit = Deposit.find(params[:deposit])
    @listing = @deposit.listing


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
      success_url: "#{root_url}deposits/success?user_id=#{current_user.id}&listing_id=#{@listing.id}&amount=#{@listing.price}&deposit_id=#{@deposit.id}",
      cancel_url: "#{root_url}listings"
    )
    @session_id = session.id
  end

  def success
    # if params[:address]
    #   @deposit = Deposit.new(deposit_params)
    #   return @deposit.save
    # end
    @deposit = Deposit.find(params[:deposit_id])
  end

  def webhook
    puts "we're here"
    status 200
  end


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



  def destroy
    @deposit.destroy
    respond_to do |format|
      format.html { redirect_to deposits_url, notice: 'deposit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private

  def set_deposit
    @deposit = Deposit.find(params[:id])
  end


  def deposit_params
    params.permit(:user_id, :address, :listing_id, :amount, :stripe_charge_id)
  end  
end
