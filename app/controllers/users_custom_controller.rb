class UsersCustomController < ApplicationController
  def index
    @users = Order.all
  end
end