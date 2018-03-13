class AccountsController < ApplicationController
  
  def index
    @account = Account.all
    
  end
  
end