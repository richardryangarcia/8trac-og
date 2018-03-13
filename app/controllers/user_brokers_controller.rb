class UserBrokersController < ApplicationController

  # Display all records associated with user
  # Not currently used, no view setup
  def index
    @user_brokers = UserBroker.get_user_brokers(current_user.id)
  end

  # Display single record
  # Not currently used, no view setup
  def show
    @user_broker = UserBroker.find(params[:id])
  end

  # Display form for new record
  def new
    @new_user_broker = UserBroker.new
  end

  # Save new record, then respond using ajax
  def create
    @created_id = UserBroker.insert(
        current_user.id,
        params[:brokers_id],
        Robinhood.login(params[:username], params[:password])
    )

    @brokers_name = params[:brokers_name]
    @brokers_id = params[:brokers_id]

    respond_to do |format|
      if @created_id && !@created_id.nil?
        @user_brokers_id = @created_id
      else
        # Set instance variables to pass back to form
        @error = "Invalid login"
        @user_broker = UserBroker.new
      end
      format.js { render :partial =>  'broker_login_prompt' }
    end
  end

  # Display form for existing record
  # Not currently used, no view setup
  def edit
    @user_broker = UserBroker.find(params[:id])
  end

  # Save changes and redirect
  # Not currently used, no view setup
  def update
    @user_broker = UserBroker.find(params[:id])
    if @user_broker.update
      redirect_to user_brokers_path
    else
      render 'new'
    end
  end

  def destroy
    respond_to do |format|
      @user_broker = UserBroker.find(params[:id])
      @user_broker.destroy

      format.js { render :partial =>  'broker_removal' }
    end
  end

  # Not currently used since form doesn't directly map to model
  private
    def allowed_params
      params.require(:user_broker).permit(:users_id, :brokers_id, :api_key)
    end

end