class Order < ActiveRecord::Base

  belongs_to :instrument
  belongs_to :trade
  belongs_to :confidence_level

    def self.get_symbol_from_orders
      orders = Order.all
      symbols = []
      for order in orders

        instrument = Instrument.find(order.instrument_id)
        symbols << instrument
      end
      symbols = symbols.uniq
    end

    def self.create_orders_from_responses(key,uid)
  		@responses['results'].each do |response|
        order = Order.find_by_robinhood_id(response['id'])
        if order.nil?
          order = Order.new
          order.added_datetime = DateTime.now.in_time_zone
          order.user_id = uid
          order.updated_at = response['updated_at'].to_s.gsub("T"," ").gsub("Z"," ")
          order.ref_id = response['ref_id']
          order.time_in_force = response['time_in_force']
          order.fees = response['fees'].to_f
          order.cancel = response['cancel']
          order.robinhood_id = response['id']
          order.cumulative_quantity = response['cumulative_quantity'].to_f
          order.stop_price = response['stop_price'].to_f
          order.reject_reason = response['reject_reason']
          order.instrument_url = response['instrument']
          inst = Instrument.find_by_additional_info_url(order.instrument_url)
          if !inst.nil?
            order.instrument_id = inst.id
          end
          order.state = response['state']
          order.trigger = response['trigger']
          order.order_type = response['type']
          order.last_transaction_at = response['last_transaction_at'].to_s.gsub("T"," ").gsub("Z"," ")
          order.price = response['price'].to_f
          order.extended_hours = response['extended_hours']
          order.account = response['account']
          order.url = response['url']
          order.created_at = response['created_at'].to_s.gsub("T"," ").gsub("Z"," ")
          order.side = response['side']
          order.position = response['position']
          order.average_price = response['average_price'].to_f
          order.quantity = response['quantity'].to_f
          order.broker_id = 1
          order.save
          order.reload

          # response['executions'].each do |ex|
          #   new_ex = Execution.new
          #   new_ex.order_id = order.id
          #   new_ex.price = ex['price'].to_f
          #   new_ex.timestamp = ex['timestamp']
          #   new_ex.settlement_date = ex['settlement_date']
          #   new_ex.robinhood_id = ex['id']
          #   new_ex.quantity = ex['quantity']
          #   new_ex.save
          # end
        end
      end

      @next_page = @responses['next']
      if !@next_page.nil?
        if @next_page.to_s.length > 0
          @responses = Robinhood.orders(key, @next_page)
          create_orders_from_responses(key,uid)
        end
      end
    end

    def self.get_orders(key,uid)
      @responses = Robinhood.orders(key)
      create_orders_from_responses(key,uid)
    end

    def self.get_recent_orders(key, last_updated_time,uid)
      @responses = Robinhood.recent_orders(key, "https://api.robinhood.com/orders/?updated_at=#{last_updated_time}")
      create_orders_from_responses(key,uid)
    end

    def self.map_array(string = " this is the the string that that i i i will will will will count the words words words words words for for for")
      hash = {}
      words = string.split(" ")
      for word in words
        if hash["#{word}"]
          hash["#{word}"] += 1
        else
          hash["#{word}"] = 1
        end
      end

      puts "\n\n\n#{hash.sort_by {|key,value| value }[1..2]}\n"

    end
end
