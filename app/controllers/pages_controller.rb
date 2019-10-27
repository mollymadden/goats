class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:my_deposits] 
  # layout "home"

  def home
    
  end

  def my_deposits
    @deposits = Deposit.where(user:current_user)
  end

  def about
  end
  
  def contact
  end

end
