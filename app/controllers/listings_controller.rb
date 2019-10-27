class ListingsController < ApplicationController
  before_action :authenticate_user!  
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :set_select_options, only: [:new, :edit, :update]

  
  def index
    @listings = Listing.all
    @skills = Skill.all
  end


  def show
  end


  def new
    @listing = Listing.new
    @listed_listings = Listing.where(user:current_user)
  end

  def edit
    puts current_user.id, @listing.user
    authorize @listing
  end


  def create

    @listing = current_user.listings.new(listing_params)

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
    authorize @listing
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to new_listing_path, notice: 'listing was successfully destroyed.' }
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
      result = params.require(:listing).permit(:title, :price, :description, :gender, :breed, :skill, :drop_off, :notes)
      # note result is a hash
      result[:price] = result[:price].to_f * 100.0
      return result
    
    end
end


