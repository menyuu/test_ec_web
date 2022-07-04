class Public::OrdersController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

  def confirmation
    @payment = params[:payment_method]
    @address = Address.find(params[:address])
    puts @address.id
    puts @address.customer_id
    puts @address.name
    puts @address.address
  end

  def completion
  end

  def create
  end
end
