class Robinhood < ActiveRecord::Base
	require 'net/http'
	require 'json'
	require 'uri'
  require 'ostruct'
	require 'net/https'


  def self.uri_object(key)
    url = ""
    case key.to_s
      when "login"
        url = "https://api.robinhood.com/api-token-auth/"
      when "investment_profile"
        url = "https://api.robinhood.com/user/investment_profile/"
      when "accounts"
        url = "https://api.robinhood.com/accounts/"
      when "ach_iav_auth"
        url = "https://api.robinhood.com/ach/iav/auth/"
      when "ach_relationships"
        url = "https://api.robinhood.com/ach/relationships/"
      when "ach_transfers"
        url = "https://api.robinhood.com/ach/transfers/"
      when "applications"
        url = "https://api.robinhood.com/applications/"
      when "dividends"
        url = "https://api.robinhood.com/dividends/"
      when "edocuments"
        url = "https://api.robinhood.com/documents/"
      when "instruments"
        url = "https://api.robinhood.com/instruments/"
      when "margin_upgrades"
        url = "https://api.robinhood.com/margin/upgrades/"
      when "markets"
        url = "https://api.robinhood.com/markets/"
      when "notifications"
        url = "https://api.robinhood.com/notifications/"
      when "orders"
        url = "https://api.robinhood.com/orders/"
      when "password_reset"
        url = "https://api.robinhood.com/password_reset/request/"
      when "portfolio"
        url = "https://api.robinhood.com/accounts/5QT61676/portfolio/"

      when "portfolios"
        url = "https://api.robinhood.com/portfolios/"
      when "positions"
        url = "https://api.robinhood.com/positions/"
      when "quotes"
        url = "https://api.robinhood.com/quotes/"
      when "document_requests"
        url = "https://api.robinhood.com/upload/document_requests/"
      when "user"
        url = "https://api.robinhood.com/user/"
      when "watchlists"
        url = "https://api.robinhood.com/watchlists/"
    end

    uri = URI.parse(url.to_s)
    return uri
  end

	def self.login(user, pass,uri = uri_object("login"))
		response = Net::HTTP.post_form(uri, {"password" => "#{pass.to_s}", "username" => "#{user.to_s}"})
		response = JSON.parse(response.body)
   		token_string = response["token"]
    	return token_string
	end

  def self.account_info(token="",  uri = uri_object("accounts"))
		https = Net::HTTP.new(uri.host, uri.port)
		https.set_debug_output($stdout)
		https.use_ssl = true
		request = Net::HTTP::Get.new(uri.path,  initheader = {

      			"Accept" => "application/json",
            "Authorization" => "Token #{token}"
			})

    response = https.request(request)
    response = JSON.parse(response.body) rescue nil

		return response
  end

  def self.get_porfolio_info(token="", uri=uri_object("portfolio"))
		https = Net::HTTP.new(uri.host, uri.port)
		https.set_debug_output($stdout)
		https.use_ssl = true
		request = Net::HTTP::Get.new(uri.path,  initheader = {

      			"Accept" => "application/json",
            "Authorization" => "Token #{token}"
			})

    response = https.request(request)
    response = JSON.parse(response.body) rescue nil

		return response
  end


  def self.place_order(account="https://api.robinhood.com/accounts/5QT61676/", instrument="https://api.robinhood.com/instruments/14290213-51ba-4678-8e3d-0f642381d26c/", quantity=1, bid_price = "", transaction="",trigger="immediate",type="market")
      if bid_price == ""
          bid_price = self.quotes("INAP")['bid_price']
      end

      uri = uri_object("orders")
  		response = Net::HTTP.post_form(uri,{"account" => account, "instrument" => instrument, "price" => "", "quantity" => quantity, "side" => "buy", "symbol" => "INAP","time_in_force" => "gfd","trigger" => "trigger","type" => type, initheader => {

  			"Accept" => "*/*",
        "Authorization" => "Token a97d4befc9e8396a42620965c67763f3edbc641a",
              "Accept-Encoding" => "gzip, deflate",
              "Accept-Language" => "en;q=1, fr;q=0.9, de;q=0.8, ja;q=0.7, nl;q=0.6, it;q=0.5",
              "Content-Type" =>  "application/x-www-form-urlencoded; charset=utf-8",
              "X-Robinhood-API-Version" =>  "1.0.0",
              "Connection" =>  "keep-alive",
              "User-Agent" =>  "Robinhood/823 (iPhone; iOS 7.1.2; Scale/2.00)",
  			}})
  		response = JSON.parse(response.body)
      return response
    end

 # 	uri = URI('http://api.nsa.gov:1337/agent')
 # http = Net::HTTP.new(uri.host, uri.port)
 # req = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json')
 # req.body = {name: 'John Doe', role: 'agent'}.to_json
 # res = http.request(req)
 # puts "response #{res.body}"

	def self.place_order(account="https://api.robinhood.com/accounts/5QT61676/", instrument="https://api.robinhood.com/instruments/14290213-51ba-4678-8e3d-0f642381d26c/", quantity=1, bid_price = "", transaction="",trigger="immediate",type="market")
			# if bid_price == ""
			# 		bid_price = self.quotes("INAP")['bid_price']
			# end

			headers  = {"Accept" => "application/json","Authorization" => "Token a97d4befc9e8396a42620965c67763f3edbc641a"}
			params = {"account" => account, "instrument" => instrument, "price" => "", "quantity" => quantity, "side" => "buy", "symbol" => "INAP","time_in_force" => "gfd","trigger" => "trigger","type" => type}
			uri = uri_object("orders")
			# http     = Net::HTTP.new(uri.host)
			# puts "\n\n\n#{uri.path}\n\n\n"
			# response = http.post(uri.path, params.to_query, headers)
			#
			# puts "\n\n\n#{response}\n\n\n"
			response = Net::HTTP.post_form(uri,{"account" => account, "instrument" => instrument, "price" => "", "quantity" => quantity, "side" => "buy", "symbol" => "INAP","time_in_force" => "gfd","trigger" => "trigger","type" => type, "initheader" => {

				"Accept" => "application/json",
				"Authorization" => "Token a97d4befc9e8396a42620965c67763f3edbc641a"
				}})

			response = JSON.parse(response.body)
			return response
		end


		def self.test_post(token="a97d4befc9e8396a42620965c67763f3edbc641a",account="https://api.robinhood.com/accounts/5QT61676/", instrument="https://api.robinhood.com/instruments/14290213-51ba-4678-8e3d-0f642381d26c/", quantity=1, bid_price = "", transaction="",trigger="immediate",type="market")
			url = "http://api.robinhood.com/orders?account=#{account}&instrument=#{instrument}&price=5.00&quantity=#{quantity}&side=buy&symbol=INAP&time_in_force=gfd&trigger=trigger&type=type"
			puts "\n\n\n\n\n\n#{url}\n\n\n\n"
			uri = URI.parse(url.to_s)
			https = Net::HTTP.new(uri.host, uri.port)
			# https.set_debug_output($stdout)
			puts "\n\n\n\n\n\nport #{uri.port}\n\n\n\n\n\n\nhost #{uri.host}\n\n\n\n\n\n\n\npath #{uri.path}\n\n\n\n\n\nquery #{uri.query}\n\n"
			https.use_ssl = true


			query = uri.path
	    if uri.query && uri.query.to_s.length > 0
	      query += "?"
	      query += uri.query
	    end
			puts "\n\n\n\nq #{query}\n\n\n\n"

			request = Net::HTTP::Post.new(query,  initheader = {

	      			"Accept" => "application/json",
	            "Authorization" => "Token #{token}"
				})



	    response = https.request(request)
	    response = JSON.parse(response.body) rescue nil

			return response
		end

		def self.test_post
			url = URI("http://api.robinhood.com/orders?account=https://api.robinhood.com/accounts/5QT61676/&instrument=https://api.robinhood.com/instruments/14290213-51ba-4678-8e3d-0f642381d26c/&price=1.00&quantity=1&side=buy&symbol=INAP&time_in_force=gfd&trigger=trigger&type=type")

			http = Net::HTTP.new(url.host, url.port)

			request = Net::HTTP::Post.new(url)
			request["authorization"] = 'Token a97d4befc9e8396a42620965c67763f3edbc641a'
			request["cache-control"] = 'no-cache'

			response = http.request(request)
			puts response.read_body
		end


		def self.get_porfolio_info(token="",account="https://api.robinhood.com/accounts/5QT61676/", instrument="https://api.robinhood.com/instruments/14290213-51ba-4678-8e3d-0f642381d26c/", quantity=1, bid_price = "", transaction="",trigger="immediate",type="market")
			url = "http://api.robinhood.com/orders/?account=#{account}&instrument=#{instrument}&price=5.00&quantity=#{quantity}&side=buy&symbol=INAP&time_in_force=gfd&trigger=trigger&type=type"
			puts "\n\n\n\n\n\n#{url}\n\n\n\n"
			uri = URI.parse(url.to_s)

			http = Net::HTTP.new(uri.host, uri.port)
			http.use_ssl = true
			path = uri.path

			# query = uri.path
			# if uri.query && uri.query.to_s.length > 0
			# 	query += "?"
			# 	query += uri.query
			# end
			#
			data=""
			# data="account=#{account}&instrument=#{instrument}&price=5.00&quantity=#{quantity}&side=buy&symbol=INAP&time_in_force=gfd&trigger=trigger&type=type"

			headers = {
					"Accept" => "application/json",
					"Authorization" => "Token #{token}"
			}

			resp, data = http.post(path, data, headers)

			puts 'Code = ' + resp.code
			puts 'Message = ' + resp.message
			resp.each {|key, val| puts key + ' = ' + val}
			puts data
	  end

  def self.get_all_instruments(token, url)
    uri = URI.parse(url.to_s)
		https = Net::HTTP.new(uri.host, uri.port)
		https.set_debug_output($stdout)
		https.use_ssl = true
    query = uri.path
    if uri.query && uri.query.to_s.length > 0
      query += "?"
      query += uri.query
    end

		request = Net::HTTP::Get.new(query,  initheader = {

      			"Accept" => "application/json",
            "Authorization" => "Token #{token}"
			})

    response = https.request(request)
    response = JSON.parse(response.body) rescue nil

		return response
  end

  def self.quote(token, symbol)
    url = "https://api.robinhood.com/quotes/#{symbol.to_s}/"
    uri = URI.parse(url.to_s)
		https = Net::HTTP.new(uri.host, uri.port)
		https.set_debug_output($stdout)
		https.use_ssl = true
    query = uri.path
    if uri.query && uri.query.to_s.length > 0
      query += "?"
      query += uri.query
    end

		request = Net::HTTP::Get.new(query,  initheader = {

      			"Accept" => "application/json",
            "Authorization" => "Token #{token}"
			})

    response = https.request(request)
    response = JSON.parse(response.body) rescue nil

		return response
  end

	def self.historical_quote(token, symbol,interval='5minute',span='day',bounds='regular')
		url = "https://api.robinhood.com/quotes/historicals/#{symbol.to_s.upcase}/?interval=#{interval}&span=#{span}&bounds=#{bounds}"
		puts "\n\n\n\n\n\n#{url}\n\n\n\n"
		uri = URI.parse(url.to_s)
		https = Net::HTTP.new(uri.host, uri.port)
		https.set_debug_output($stdout)
		https.use_ssl = true
		query = uri.path
		if uri.query && uri.query.to_s.length > 0
			query += "?"
			query += uri.query
		end

		request = Net::HTTP::Get.new(query,  initheader = {

						"Accept" => "application/json",
						"Authorization" => "Token #{token}"
			})
		response = https.request(request)
		response = JSON.parse(response.body) rescue nil

		return response
	end



	def self.orders(token,url = "https://api.robinhood.com/orders/")
      uri = URI.parse(url.to_s)
  		https = Net::HTTP.new(uri.host, uri.port)
  		https.set_debug_output($stdout)
  		https.use_ssl = true
      query = uri.path
      if uri.query && uri.query.to_s.length > 0
        query += "?"
        query += uri.query
      end
  		request = Net::HTTP::Get.new(query,  initheader = {

  			"Accept" => "*/*",
              "Accept-Encoding" => "gzip, deflate",
              "Accept-Language" => "en;q=1, fr;q=0.9, de;q=0.8, ja;q=0.7, nl;q=0.6, it;q=0.5",
              "Content-Type" =>  "application/x-www-form-urlencoded; charset=utf-8",
              "X-Robinhood-API-Version" =>  "1.0.0",
              "Connection" =>  "keep-alive",
              "User-Agent" =>  "Robinhood/823 (iPhone; iOS 7.1.2; Scale/2.00)",
              "Authorization" => "Token #{token}"
  			})

      response = https.request(request)
      response = JSON.parse(response.body) rescue nil

  		return response
	end



  def self.watchlists(token,uri = uri_object("watchlists"))

    https = Net::HTTP.new(uri.host, uri.port)
    https.set_debug_output($stdout)
    https.use_ssl = true
    request = Net::HTTP::Get.new(uri.path,  initheader = {

      		"Accept" => "*/*",
            "Accept-Encoding" => "gzip, deflate",
            "Accept-Language" => "en;q=1, fr;q=0.9, de;q=0.8, ja;q=0.7, nl;q=0.6, it;q=0.5",
            "Content-Type" =>  "application/x-www-form-urlencoded; charset=utf-8",
            "X-Robinhood-API-Version" =>  "1.0.0",
            "Connection" =>  "keep-alive",
            "User-Agent" =>  "Robinhood/823 (iPhone; iOS 7.1.2; Scale/2.00)",
            "Authorization" => "Token #{token}"
      })

    response = https.request(request)
    response = JSON.parse(response.body)
    return response
  end

	def self.recent_orders(token,url)
      uri = URI.parse(url.to_s)
  		https = Net::HTTP.new(uri.host, uri.port)
  		https = Net::HTTP.new(uri.host, uri.port)
  		https.set_debug_output($stdout)
  		https.use_ssl = true
      query = uri.path
      if uri.query && uri.query.to_s.length > 0
        query += "?"
        query += uri.query
      end
  		request = Net::HTTP::Get.new(query,  initheader = {

  			"Accept" => "*/*",
              "Accept-Encoding" => "gzip, deflate",
              "Accept-Language" => "en;q=1, fr;q=0.9, de;q=0.8, ja;q=0.7, nl;q=0.6, it;q=0.5",
              "Content-Type" =>  "application/x-www-form-urlencoded; charset=utf-8",
              "X-Robinhood-API-Version" =>  "1.0.0",
              "Connection" =>  "keep-alive",
              "User-Agent" =>  "Robinhood/823 (iPhone; iOS 7.1.2; Scale/2.00)",
              "Authorization" => "Token #{token}"
  			})

      response = https.request(request)
      response = JSON.parse(response.body) rescue nil

  		return response
	end


  def ask_price
  	return @data['ask_price']
  end

  def ask_size
  	return @data['ask_size']
  end

  def bid_price
  	return @data['bid_price']
  end

  def bid_size
  	return @data['bid_size']
  end

  def previous_close
  	return @data['previous_close']
  end

  def previous_close_date
  	return @data['previous_close_date']
  end

  def adjusted_previous_close
  	return @data['adjusted_previous_close']
  end

  def last_trade_price
  	return @data['last_trade_price']
  end

  def last_updated_at
  	return @data['updated_at']
  end

  def self.investment_profile(token,uri = uri_object("investment_profile"))
  end
  def self.accounts(token,uri = uri_object("accounts"))
  end
  def self.ach_iav_auth(token,uri = uri_object("ach_iav_auth"))
  end
  def self.ach_relationships(token,uri = uri_object("ach_relationships"))
  end
  def self.ach_transfers(token,uri = uri_object("ach_transfers"))
  end
  def self.applications(token,uri = uri_object("applications"))
  end
  def self.dividends(token,uri = uri_object("dividends"))
  end
  def self.edocuments(token,uri = uri_object("edocuments"))
  end
  def self.instruments(token,uri = uri_object("instruments"))
  end
  def self.margin_upgrades(token,uri = uri_object("margin_upgrades"))
  end
  def self.markets(token,uri = uri_object("markets"))
  end
  def self.notifications(token,uri = uri_object("notifications"))
  end
  def self.password_reset(token,uri = uri_object("password_reset"))
  end
  def self.positions(token,uri = uri_object("positions"))
  end
  def self.quotes_endpoint(token,uri = uri_object("quotes"))
  end
  def self.document_requests(token,uri = uri_object("document_requests"))
  end
  def self.user(token,uri = uri_object("user"))
  end
  def self.watchlists(token,uri = uri_object("watchlists"))
  end


end
