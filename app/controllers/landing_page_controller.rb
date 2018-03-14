class LandingPageController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if user_signed_in?
      redirect_to :controller => :instruments
    end
  end

end