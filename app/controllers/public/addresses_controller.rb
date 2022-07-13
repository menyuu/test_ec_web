class Public::AddressesController < ApplicationController
  def index
    @addresses = current_customer.addresses.where(customer_id: current_customer)
  end

  def show
    @address = current_customer.addresses.find(params[:id])
  end

  def new
  end

  def edit
  end
end
