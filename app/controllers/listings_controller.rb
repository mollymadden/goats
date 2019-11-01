class ListingsController < ApplicationController
  before_action :authenticate_user!  
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :set_user_listing, only: [:edit, :update, :destroy]
  before_action :set_select_options, only: [:new, :edit, :update]




  def index
    @listings = Listing.all.order('updated_at DESC')

  end


  def show
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
        format.html { redirect_to listing_path, notice: "#{@listing.title} has been updated." }
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
      format.html { redirect_to listings_path, notice: "#{@listing.title} has been deleted." }
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
      params.require(:listing).permit(:title, :price, :description, :gender, :breed, :skill_id, :drop_off, :notes, :image, :user_id)
    end



    def set_user_listing
      id = params[:id]
      @listing = current_user.listings.find_by_id( id )

      if @listing == nil
        redirect_to listings_path
      elsif @listing.price == nil
        @listing.price = 0
      end

    end
  end
