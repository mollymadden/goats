class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:deposits] 
  # layout "home"

  def home
    
  end

  def deposits
    @deposits = Deposit.where(user:current_user)
  end

  def about
  end
  
  def contact
  end

end
