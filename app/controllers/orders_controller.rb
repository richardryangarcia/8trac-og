class OrdersController < ApplicationController

  # layout 'sidenav'

  def index

    #@order = Order.new

    # if params[:page] && params[:page].to_i > 1
    #   @orders = Order.paginate(:page => params[:page], :per_page => 30).where(:user_id => current_user.id).order("last_transaction_at desc")
    # else
    #   @orders = Order.paginate(:page => 1, :per_page => 30).where(:user_id => current_user.id).order("last_transaction_at desc")
    # end
    # @orders_count = Order.where(:user_id => current_user.id).count
    # @brokers = Broker.all
    # @symbols = Instrument.find_by_sql("select * from instruments where id in (select instrument_id from orders where user_id = #{current_user.id})")

    @order = []
  end

  def update_users_orders

    current_user.api_keychain.each do |key, value|
      if key == "robinhood"
        update_robinhood_orders
      end
    end

    redirect_to '/orders/index'
  end

  def update_robinhood_orders
    if !Order.exists?(:user_id => current_user.id )
      Order.get_orders(current_user.api_keychain["robinhood"],current_user.id)
      Trade.update_trades(current_user.id)
    else
      Order.get_recent_orders(current_user.api_keychain["robinhood"],current_user.last_order_update,current_user.id)
      Trade.update_trades(current_user.id)
    end
  end

  def add_order_comment
    @order = Order.find(params[:id].to_i)

    if params[:order][:notes] && params[:order][:notes].to_s.length > 0 && params[:order][:notes].to_s != @order.notes.to_s
      @order.notes = params[:order][:notes].to_s
      @order.save
      @order.reload
    end

    respond_to do |format|

      format.js { render :partial =>  'add_comment' }
    end

    # render :partial => 'add_comment'
  end

  def add_order_confidence
    @order = Order.find(params[:id].to_i)

    if params[:confidence_level_id] && params[:confidence_level_id].to_i > 0
      @order.confidence_level_id = params[:confidence_level_id].to_i
      @order.save
      @order.reload
    end

    # respond_to do |format|
    #
    #   format.js { render :partial =>  'add_confidence' }
    # end

    render :partial => 'add_confidence'
  end

end
