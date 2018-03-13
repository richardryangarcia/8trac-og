class Instrument < ActiveRecord::Base

  def self.process_instrument

      @results["results"].each do |r|
        instrument = Instrument.new
        instrument.min_tick_size = r['min_tick_size']
        instrument.splits_url = r["splits"]
        instrument.margin_initial_radio = r["margin_initial_ratio"]
        instrument.additional_info_url = r["url"]
        instrument.quote_detail_url = r["quote"]
        instrument.symbol = r["symbol"]
        instrument.bloomberg_unique = r["bloomberg_unique"]
        instrument.list_date = r["list_date"]
        instrument.fundamentals_url = r["fundamentals"]
        instrument.state = r["state"]
        instrument.day_trade_ratio = r["day_trade_ratio"]
        instrument.tradeable = r["tradeable"]
        instrument.maintenance_ratio = r["maintenance_ratio"]
        instrument.robinhood_id = r["id"]
        instrument.market_url = r["market"]
        instrument.name = r["name"]
        instrument.save
        end

        @next_page = @results["next"]
        if @next_page && !@next_page.nil?
          if @next_page.to_s.length > 0
            @results = Robinhood.get_all_instruments("a97d4befc9e8396a42620965c67763f3edbc641a", @next_page)
            process_instrument
          end
        end
  end

  def self.get_all_instruments
    @results = Robinhood.get_all_instruments("a97d4befc9e8396a42620965c67763f3edbc641a","https://api.robinhood.com/instruments/")

    process_instrument
  end

  def self.get_all_fundamental_info
    Instrument.find_each do |instrument|
      instrument.get_fundamental_info
    end
  end

  def get_fundamental_info(api_key="a97d4befc9e8396a42620965c67763f3edbc641a")
    r = Robinhood.get_all_instruments(api_key,self.fundamentals_url)
    if r && !r.nil?
      self.open_price = r["open"]
      self.high = r["high"]
      self.low = r["low"]
      self.volume = r["volume"]
      self.average_volume = r["average_volume"]
      self.high_fifty_two_weeks = r["high_52_weeks"]
      self.dividend_yield = r["dividend_yield"]
      self.low_fifty_two_weeks = r["low_52_weeks"]
      self.market_cap = r["market_cap"]
      self.pe_ratio = r["pe_ratio"]
      self.description = r["description"]
      self.save
    end
  end

  def self.get_markets
    market_urls = Instrument.find_by_sql("select distinct market_url from instruments").map(&:market_url)
    for market in market_urls
      @response = Robinhood.get_all_instruments("a97d4befc9e8396a42620965c67763f3edbc641a",market)

      new_market = Market.new
      new_market.website = @response["website"]
      new_market.city = @response["city"]
      new_market.name = @response["name"]
      new_market.url = @response["url"]
      new_market.country = @response["country"]
      new_market.operating_mic = @response["operating_mic"]
      new_market.acronym = @response["acronym"]
      new_market.timezone = @response["timezone"]
      new_market.mic = @response["mic"]
      new_market.save

    end
  end

  def self.update_all_quotes
    Instrument.find_each do |instr|
      instr.update_quote_data
    end
  end

  def update_quote_data(api_key)
    @response = Robinhood.quote(api_key,self.symbol)
    if @response && !@response.nil?
      self.ask_price = @response["ask_price"]
      self.ask_size = @response["ask_size"]
      self.bid_price = @response["bid_price"]
      self.bid_size = @response["bid_size"]
      self.last_trade_price = @response["last_trade_price"]
      self.last_extended_hours_trade_price = @response["last_extended_hours_trade_price"]
      self.previous_close = @response["previous_close"]
      self.adjusted_previous_close = @response["adjusted_previous_close"]
      self.previous_close_date = @response["previous_close_date"]
      self.trade_halted = @response["trade_halted"]
      self.last_trade_price_source = @response["last_trade_price_source"]
      self.save
    end

  end


  def get_latest_open_high_low_price
    url = "https://api.robinhood.com/instruments/#{self.robinhood_id}"
    uri = URI.parse(url)
    puts "\n\n\n#{uri}\n\n"
    output = Net::HTTP.get_response(uri)
    puts "\n\n\n\n\noutput#{output}\n\n"
    output = JSON.parse(output.body)
    puts "\n\n\n\n\noutput#{output}\n\n"
    begin

        instrument = Instrument.find_or_create_by(symbol: output["symbol"])

        f_uri = URI.parse(output["fundamentals"])
        f_output = Net::HTTP.get_response(f_uri)
        f_output = JSON.parse(f_output.body)



        instrument.open_price = f_output["open"].to_f
        instrument.high  = f_output["high"].to_f
        instrument.low = f_output["low"].to_f
        instrument.save

    rescue => e
        puts e.inspect
    end



  end

  def up?
    result = false
    num  = (self.last_trade_price - self.open_price)
    if num >= 0
      result = true
    end
    return result
  end


  def self.process_instrument_urls
          Order.find_each do |order|
              uri = URI.parse(order.instrument)
              output = Net::HTTP.get_response(uri)
              output = JSON.parse(output.body)

              begin

                  instrument = Instrument.find_or_create_by(symbol: output["symbol"])
                  instrument.name   = output["name"]
                  instrument.state  = output["state"]
                  instrument.tradeable = output["tradeable"]
                  instrument.robinhood_id = output["id"]
                  instrument.save

                  instrument.save

              rescue => e
                  puts e.inspect
              end

              order.instrument_id = instrument.id
              order.save
          end
      end

end
