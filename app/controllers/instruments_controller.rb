class InstrumentsController < ApplicationController

  def index

    if params[:page] && params[:page].to_i > 1
      @instruments = Instrument.paginate(:page => params[:page], :per_page => 30)
    else
      @instruments = Instrument.paginate(:page => 1, :per_page => 30)
    end

    @instruments_count = Instrument.find_by_sql("select count(*) as c from instruments").map(&:c)

  end

  def show
    if params[:id] && params[:id].to_i > 0
      @instrument = Instrument.find(params[:id])

    elsif params[:symbol] && params[:symbol].to_s.length > 0
      @instrument = Instrument.find_by_symbol(params[:symbol])
    end

    @instrument.get_fundamental_info(current_user.api_keychain["robinhood"])
    @instrument.update_quote_data(current_user.api_keychain["robinhood"])

    @response = Robinhood.quote(current_user.api_keychain["robinhood"],@instrument.symbol)
  end

  def search_instruments
    if params[:search_string] && params[:search_string].to_s.length > 0
      @search_string = params[:search_string].to_s
    end

    @instruments = Instrument.find_by_sql("select * from instruments where (symbol like '%#{@search_string}%' or name like '%#{@search_string}%') order by symbol, name limit 50")

    if @instruments && @instruments.size == 1
      @instrument = @instruments[0]
    end

    if params[:commit] && params[:commit].to_i == 1

    end

    render :partial => '/layouts/search_results'
  end

  def update_current_price
    @instrument = Instrument.find(params[:id])

    @instrument.update_quote_data(current_user.api_key)
    @instrument.reload

    puts "\n\n\nhere\n\n\n"
    render :partial => 'instrument_current_price'
  end

  def test_remote
    puts"\n\n\nim here !!!!!\n\n\n"
    render :partial => 'test_remote'
  end

end
