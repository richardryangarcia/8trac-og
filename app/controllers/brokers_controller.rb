class BrokersController < ApplicationController
  def index
    @brokers = Broker.all
  end

  def show
    @broker = Broker.find(params[:id])
  end

  def edit
    @broker = Broker.find(params[:id])
  end
end