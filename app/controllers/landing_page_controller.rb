class LandingPageController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if user_signed_in?
      redirect_to :controller => :orders
    end
  end

end