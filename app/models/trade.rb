class Trade < ActiveRecord::Base
  belongs_to :initial_order, :class_name => 'Order'
  belongs_to :closing_order, :class_name => 'Order'
  belongs_to :instrument
  has_many :orders

  def get_new_effective_price(new_avg_price, new_quantity)
    current_total_price = (self.effective_buy_price * self.total_buy_quantity)
    new_total_price = (new_avg_price * new_quantity)
    new_quantity = (self.total_buy_quantity + new_quantity)
    return_total_price = (new_total_price + current_total_price)
    return_avg_price = (return_total_price / new_quantity)
    return return_avg_price
  end

  def get_new_effective_sell_price(new_avg_price, new_quantity)
    current_total_price = (self.effective_sell_price * self.total_sell_quantity)
    new_total_price = (new_avg_price * new_quantity)
    new_quantity = (self.total_sell_quantity + new_quantity)
    return_total_price = (new_total_price + current_total_price)
    return_avg_price = (return_total_price / new_quantity)
    return return_avg_price
  end

  def self.update_trades(user_id)
    orders = Order.where(:state => 'filled',:trade_id => 0).order("id desc")
    for order in orders
      if order.side.to_s.eql?("buy")
        if Trade.exists?(:instrument_id => order.instrument_id,:closing_created_datetime => nil)
          t = Trade.where(:instrument_id => order.instrument_id, :closing_created_datetime => nil).first
          t.total_buy_quantity = (t.total_buy_quantity + order.quantity)
          t.effective_buy_price = t.get_new_effective_price(order.average_price, order.quantity)
          t.updated_at = DateTime.now.in_time_zone
          t.save
          t.reload

          order.trade_id = t.id
          order.save
        else
          t = Trade.new
          t.user_id = user_id
          t.broker_id = order.broker_id
          t.symbol = order.instrument.symbol
          t.instrument_id = order.instrument_id
          t.initial_order_id = order.id
          t.initial_created_datetime = order.created_at
          t.initial_last_transaction_datetime = order.last_transaction_at
          t.effective_buy_price = order.average_price
          t.total_buy_quantity = order.quantity
          t.trade_status = "unrealized"
          dt =  DateTime.now.in_time_zone
          t.created_at = dt
          t.updated_at = dt
          t.save
          t.reload

          order.trade_id = t.id
          order.save
        end
      elsif order.side.to_s.eql?("sell")
        if Trade.exists?(:instrument_id => order.instrument_id, :closing_created_datetime => nil)
          t = Trade.where(:instrument_id => order.instrument_id, :closing_created_datetime => nil).first
          t.effective_sell_price = t.get_new_effective_sell_price(order.average_price, order.quantity)
          t.total_sell_quantity = (t.total_sell_quantity + order.quantity)
          t.updated_at = DateTime.now.in_time_zone
          if t.total_sell_quantity == t.total_buy_quantity
            t.closing_order_id = order.id
            t.closing_created_datetime = order.created_at
            t.closing_last_transaction_datetime = order.last_transaction_at
            t.trade_status = "realized"
            t.realized_gains = t.effective_sell_price - t.effective_buy_price
            t.save
            t.reload
            # t.update_trade_stats
          else
            t.save
            t.reload
          end


          order.trade_id = t.id
          order.save
        end
      end
    end
  end

  # calculate stats

  def self.trade_stats_sql(params)
    sql = ""
    if params && !params.nil?
      if params[:trade] && params[:trade][:broker_id] && params[:trade][:broker_id].to_i > 0
        sql += " and broker_id = #{params[:trade][:broker_id].to_i} "
      end

      if params[:trade] && params[:trade][:instrument_id] && params[:trade][:instrument_id].to_i > 0
        sql += " and instrument_id = #{params[:trade][:instrument_id].to_i} "
      end

      if params[:trade] && params[:trade][:date_start] && params[:trade][:date_start].to_s.length > 0
        sql += " and closing_last_transaction_datetime >= DATE('#{params[:trade][:date_start].strftime('%Y-%m-%d')}') "
      end

      if params[:trade] && params[:trade][:date_end] && params[:trade][:date_end].to_s.length > 0
        sql += " and closing_last_transaction_datetime <= DATE('#{params[:trade][:date_end].strftime('%Y-%m-%d')}') "
      end
    end
    return sql
  end

  def self.total_profit(uid,params = nil)
    sql = trade_stats_sql(params)
    total_profit = Trade.find_by_sql("select TRUNCATE(sum(realized_gains),2) as total from trades where realized_gains > 0.0 and user_id = #{uid} #{sql} ").map(&:total)
    return total_profit[0].to_f
  end

  def self.total_loss(uid,params = nil)
    sql = trade_stats_sql(params)
    total_loss = Trade.find_by_sql("select TRUNCATE(sum(realized_gains),2) as total from trades where realized_gains < 0.0 and user_id = #{uid} #{sql} ").map(&:total)
    return total_loss[0].to_f
  end

  def self.average_return(uid,params = nil)
    sql = trade_stats_sql(params)
    average_return = Trade.find_by_sql("select TRUNCATE(avg(realized_gains),2) as average from trades where user_id = #{uid} #{sql}").map(&:average)
    return average_return[0].to_f
  end


  def self.min_return(uid,params = nil)
    sql = trade_stats_sql(params)
    min_return = Trade.find_by_sql("select TRUNCATE(min(realized_gains),2) as min from trades where user_id = #{uid} #{sql}").map(&:min)
    return min_return[0].to_f
  end

  def self.average_loss(uid,params = nil)
    sql = trade_stats_sql(params)
    average_loss = Trade.find_by_sql("select TRUNCATE(avg(realized_gains),2) as average from trades where realized_gains < 0.0 and user_id = #{uid} #{sql}").map(&:average)
    return average_loss[0].to_f
  end

  def self.average_win(uid,params = nil)
    sql = trade_stats_sql(params)
    average_win = Trade.find_by_sql("select TRUNCATE(avg(realized_gains),2) as average from trades where realized_gains > 0.0 and user_id = #{uid} #{sql}").map(&:average)
    return average_win[0].to_f
  end

  def self.max_return(uid,params = nil)
    sql = trade_stats_sql(params)
    max_return = Trade.find_by_sql("select TRUNCATE(max(realized_gains),2) as max from trades where user_id = #{uid} #{sql}").map(&:max)
    return max_return[0].to_f
  end

  def self.return_distributions(uid=1)
    h = {}

    min = Trade.min_return(uid)
    max = Trade.max_return(uid)
    diff = max - min
    ten = (diff.to_f * 0.10)

    index = 0
    while index < 9
      low = ('%.2f' % min)
      high = ('%.2f' % (min + ten.to_f))
      h["#{low} - #{high}"] = Trade.find_by_sql("select count(*) as c from trades where TRUNCATE(realized_gains, 2) >= TRUNCATE(#{low.to_f},2) and TRUNCATE(realized_gains, 2) < TRUNCATE(#{high.to_f},2) ").map(&:c)[0]
      min += ten.to_f
      index += 1
    end
    low = ('%.2f' % min)
    high = ('%.2f' % (min + ten.to_f))
    h["#{low} - #{high}"] = Trade.find_by_sql("select count(*) as c from trades where TRUNCATE(realized_gains, 2) >= TRUNCATE(#{low.to_f},2) and TRUNCATE(realized_gains, 2) <= TRUNCATE(#{high.to_f},2) ").map(&:c)[0]
    return h
  end

  def self.holding_distributions(uid)
    holdings = []
    times_in_minutes = [5,60,720,1440,2880,10080,43800,525600]
    index = 0
    while index < times_in_minutes.size
      if index == 0
        count = Trade.find_by_sql("select count(*) as count from trades where TIMESTAMPDIFF(minute,initial_last_transaction_datetime,closing_last_transaction_datetime) > 0 and TIMESTAMPDIFF(minute,initial_last_transaction_datetime,closing_last_transaction_datetime) <= #{times_in_minutes[index]}").map(&:count)
      elsif index == times_in_minutes.size - 1
        count = Trade.find_by_sql("select count(*) as count from trades where TIMESTAMPDIFF(minute,initial_last_transaction_datetime,closing_last_transaction_datetime) > #{times_in_minutes[index - 1] } and TIMESTAMPDIFF(minute,initial_last_transaction_datetime,closing_last_transaction_datetime) <= #{times_in_minutes[index]}").map(&:count)
        holdings << count[0].to_i
        count = Trade.find_by_sql("select count(*) as count from trades where TIMESTAMPDIFF(minute,initial_last_transaction_datetime,closing_last_transaction_datetime) > #{times_in_minutes[index]}").map(&:count)
      else
        count = Trade.find_by_sql("select count(*) as count from trades where TIMESTAMPDIFF(minute,initial_last_transaction_datetime,closing_last_transaction_datetime) > #{times_in_minutes[index -1]} and TIMESTAMPDIFF(minute,initial_last_transaction_datetime,closing_last_transaction_datetime) <= #{times_in_minutes[index]}").map(&:count)
      end
      holdings << count[0].to_i
      index += 1
    end

    return holdings
  end

  def self.user_trade_instruments(uid)
    instrument_ids = Trade.where(:user_id => uid, :trade_status => 'realized').select(:instrument_id).group(:instrument_id).map(&:instrument_id)
    instruments = []
    if instrument_ids.size > 0
      instruments = Instrument.where("id in (#{instrument_ids.join(',')})")
    end
    return instruments
  end

  def self.user_trade_brokers(uid)
    broker_ids = UserBroker.where(:users_id => uid).select(:brokers_id).group(:brokers_id).map(&:brokers_id)
    brokers = []
    if broker_ids.size > 0
      brokers = Broker.where("id in (#{broker_ids.join(',')})")
    end
    return brokers
  end

end
