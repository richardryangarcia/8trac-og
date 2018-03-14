class User < ActiveRecord::Base
  has_many :user_brokers

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def last_order_update
    date = Order.find_by_sql("select added_datetime from orders  where user_id = #{self.id} order by added_datetime desc limit 1").map(&:added_datetime)
    return date
  end

  def api_keychain
    keychain = Hash.new
    records = UserBroker.where(users_id: self.id)
    records.each { |user_broker|
      broker_name = Broker.find_by(id: user_broker.brokers_id).name
      keychain[broker_name.downcase.tr(' ', '_')] = user_broker.api_key
    }

    # Hashmap, brokername => api_key
    return keychain
  end

  def first_trade_date
    earliest_date = Trade.find_by_sql("select min(closing_last_transaction_datetime) from trades where user_id = #{self.id}")
    return earliest_date
  end

  def setup_blockchain_instance

  end
end
