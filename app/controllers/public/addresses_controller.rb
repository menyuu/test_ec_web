class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_customer.addresses.where(customer_id: current_customer)
  end

  def create
    @address = current_customer.addresses.new(address_params)
    @address.save
    redirect_to root_path
  end

  def edit
    @address = current_customer.addresses.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def address_params
    params.require(:address).permit(:code, :address, :name)
  end
end
