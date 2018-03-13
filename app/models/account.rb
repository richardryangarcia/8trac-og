class Account < ActiveRecord::Base
  
  def self.api_key
    return "a97d4befc9e8396a42620965c67763f3edbc641a"
  end
  
  def self.update_account_data
    response = Robinhood.account_info(api_key)
    
    response['results'].each do |x|
      @account = Account.find_or_initialize_by(account_number: x['account_number'])

      @account.user_id = 1
      @account.updated_at = DateTime.now.in_time_zone
      @account.user_url = x['user']
      @account.deactivated = x['deactivated']
      @account.last_modified_at = x['updated_at']
      @account.portfolio_url = x['portfolio']
      @account.withdrawal_halted = x['withdrawal_halted']
      @account.cash_available_for_withdrawal = x['cash_available_for_withdrawal']
      @account.account_type = x['type']
      @account.sma = x['sma']
      @account.sweep_enabled = x['sweep_enabled']
      @account.deposit_halted = x['deposit_halted']
      @account.buying_power = x['buying_power']    
      @account.max_early_access_amount = x['max_ach_early_access_amount']
      @account.cash_held_for_orders = x['cash_held_for_orders']
      @account.only_position_closing_trades = x['only_position_closing_trades']
      @account.additional_account_info_url = x['url']
      @account.positions_url = x['positions']
      @account.created_at = x['created_at']
      @account.cash_amount = x['cash']
      @account.sma_held_for_orders = x['sma_held_for_orders']
      @account.account_number = x['account_number']
      @account.uncleared_deposits = x['uncleared_deposits']
      @account.unsettled_funds = x['unsettled_funds']
      
      if @account.account_type 
        if @account.account_type.to_s.eql?("cash")
          # cash balances          
          @account.cash_cash_held_for_orders = x['cash_balances']['cash_held_for_orders']
          @account.cash_created_at = x['cash_balances']['created_at']
          @account.cash_cash_amount = x['cash_balances']['cash']
          @account.cash_buying_power = x['cash_balances']['buying_power']
          @account.cash_last_modified_at = x['cash_balances']['updated_at']
          @account.cash_cash_available_for_withdrawal = x['cash_balances']['cash_available_for_withdrawal']
          @account.cash_outstanding_interest = x['cash_balances']['outstanding_interest']
          @account.cash_uncleared_deposits = x['cash_balances']['uncleared_deposits']
          @account.cash_unsettled_funds = x['cash_balances']['unsettled_funds']
          
        elsif @account.account_type.to_s.eql?("margin")
          # margin balances
          @account.margin_day_trade_buying_power = x['margin_balances']['day_trade_buying_power']
          @account.margin_created_at = x['margin_balances']['created_at']
          @account.margin_overnight_buying_power_held_for_orders = x['margin_balances']['overnight_buying_power_held_for_orders']
          @account.margin_cash_held_for_orders = x['margin_balances']['cash_held_for_orders']
          @account.margin_day_trade_buying_power_held_for_orders = x['margin_balances']['day_trade_buying_power_held_for_orders']
          @account.margin_marked_pattern_day_trader_at = x['margin_balances']['marked_pattern_day_trader_date']
          @account.margin_cash_amount = x['margin_balances']['cash']
          @account.margin_unallocated_margin_cash = x['margin_balances']['unallocated_margin_cash']
          @account.margin_last_modified_at = x['margin_balances']['updated_at']
          @account.margin_cash_available_for_withdrawal = x['margin_balances']['cash_available_for_withdrawal']
          @account.margin_limit = x['margin_balances']['margin_limit']
          @account.margin_overnight_buying_power = x['margin_balances']['overnight_buying_power']
          @account.margin_uncleared_deposits = x['margin_balances']['uncleared_deposits']
          @account.margin_unsettled_funds = x['margin_balances']['unsettled_funds']
          @account.margin_day_trade_ratio = x['margin_balances']['day_trade_ratio']
          @account.margin_overnight_ratio = x['margin_balances']['overnight_ratio']
      
        end
      end
    end #end response
    
    @account.save
    
    
  end
  
end