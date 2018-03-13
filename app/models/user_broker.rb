class UserBroker < ActiveRecord::Base
  belongs_to :user
  belongs_to :broker

  def self.insert(users_id, brokers_id, api_key)
    if api_key && !api_key.nil?
      # Check for existing record, update any that exist
      @existing_record = UserBroker.find_by(users_id: users_id, brokers_id: brokers_id)
      if @existing_record && !@existing_record.nil?
        @existing_record.update(:api_key => api_key)
        @existing_record.touch
      else
        @new_user_broker = UserBroker.new
        @new_user_broker.users_id = users_id
        @new_user_broker.brokers_id = brokers_id
        @new_user_broker.api_key = api_key
        @new_user_broker.save
      end

      return @new_user_broker.id
    else
      return
    end
  end

  def self.get_user_brokers(users_id)
    # Check for existing record, destroy any that exist
    @records = UserBroker.where(users_id: users_id)
    return @records
  end

  def self.get_user_broker(users_id, brokers_id)
    # Check for existing record, destroy any that exist
    @records = UserBroker.find_by(users_id: users_id, brokers_id: brokers_id)
    return @records
  end
end

