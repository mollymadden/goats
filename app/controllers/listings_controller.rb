class ListingsController < ApplicationController
  before_action :authenticate_user!  
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :set_user_listing, only: [:edit, :update, :destroy]
  before_action :set_select_options, only: [:new, :edit, :update]




  
  def index
    @listings = Listing.all
  end


  def show
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
      success_url: "#{root_url}deposits/success?userId=#{current_user.id}&listingId=#{@listing.id}",
      cancel_url: "#{root_url}listings"
  )

    @session_id = session.id
    end
  end


  def new
    @listing = Listing.new
    @listed_listings = Listing.where(user:current_user)
  end

  def edit
    puts current_user.id, @listing.user
    # authorize @listing
  end


  def create
    @listing = current_user.listings.new(listing_params)
    # byebug

      if @listing.save
        redirect_to @listing
      else
        render :new
      end

  end

  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to new_listing_path, notice: 'listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to new_listing_path, notice: 'listing was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
   
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def set_select_options

     @select_options = []
     Skill.all.each_with_index do |skill, index| 
       @select_options.push([skill.title,index+1]) 
     end 
    end

    def listing_params
      result = params.require(:listing).permit(:title, :price, :description, :gender, :breed, :skill_id, :drop_off, :notes, :image, :user_id)
      # note result is a hash
      result[:price] = result[:price].to_f * 100.0
      return result
    
    end



    def set_user_listing
    id = params[:id]
    @listing = current_user.listings.find_by_id( id )

    if @listing == nil
      redirect_to listings_path
    else
    if @listing.price == nil
      @listing.price = 0
      end
    end

    end




  
