class Performance

  def self.get_pl(symbol)
    instrument = Instrument.find_by_symbol(symbol)
    orders = Order.where(:state => 'filled', :instrument_id => instrument.id)

    buy_orders = []
    sell_orders = []
    for order in orders
      if order.side == "buy"
        buy_orders << order
      else
        sell_orders << order
      end
    end


    total_buy_value = 0.0
    total_sell_value = 0.0

    for buy in buy_orders
      puts "BUY ORDER avg price #{buy.average_price}    quantity #{buy.quantity}"
      total_buy_value += buy.quantity * buy.average_price
      puts "total buy value = #{total_buy_value}"
    end
    for sell in sell_orders
      puts "SELL ORDER avg price #{sell.average_price}    quantity #{sell.quantity}"
      total_sell_value += sell.quantity * sell.average_price
      puts "total sell value = #{total_sell_value}"

    end

    return profit = total_sell_value - total_buy_value

  end


  def self.performance_by_symbols
    #symbols = Instrument.uniq.pluck(:symbol)
    symbols = Order.get_symbol_from_orders
    profit = 0.0
    table = []
    for symbol in symbols
      profit = Performance.get_pl(symbol.symbol)
      table << "#{symbol.symbol} : #{profit}"
    end
    pp(table)
  end


end