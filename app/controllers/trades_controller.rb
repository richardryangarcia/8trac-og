class TradesController < ApplicationController

  # layout 'sidenav'

  def index

    if params[:page] && params[:page].to_i > 1
      @trades = Trade.paginate(:page => params[:page], :per_page => 30).where(:user_id => current_user.id,:trade_status => 'realized').order("closing_last_transaction_datetime desc")
    else
      @trades = Trade.paginate(:page => 1, :per_page => 30).where(:user_id => current_user.id, :trade_status => 'realized').order("closing_last_transaction_datetime desc")
    end
    @trades_count = Trade.count(:user_id => current_user.id,:trade_status => 'realized')

  end

  def stats

    @total_profit = Trade.total_profit(current_user.id,params)
    @total_loss = Trade.total_loss(current_user.id,params)
    @average_return = Trade.average_return(current_user.id,params)
    @max_return = Trade.max_return(current_user.id,params)
    @min_return = Trade.min_return(current_user.id,params)
    @average_win = Trade.average_win(current_user.id,params)
    @average_loss = Trade.average_loss(current_user.id,params)

    @brokers = Trade.user_trade_brokers(current_user.id)
    @symbols = Trade.user_trade_instruments(current_user.id)

  end

  def return_distributions
    @return_distributions = Trade.return_distributions(current_user.id)

  end

  def holding_distributions
    @distributions = Trade.holding_distributions(current_user)

  end

end
