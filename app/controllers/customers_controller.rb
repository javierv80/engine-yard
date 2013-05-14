class CustomersController < ApplicationController
  
  before_filter :authenticate_user!

  def index
  	@customers = current_user.customers
  end

  def new
  	@customer = Customer.new
  end

  def create
  	@customer = current_user.customers.build(params[:customer])
  	if @customer.save
  		flash[:success] = "Cliente Creado"
  		redirect_to @customer
  	else
  		render 'new'
  	end
  end

  def show
  	@customer = current_user.customers.find(params[:id])
  end

  def edit
  	@customer = current_user.customers.find(params[:id])
  end

  def update
  	@customer = current_user.customers.find(params[:id])
  	if 
  		@customer.update_attributes(params[:customer])
  		flash[:success] = "Cliente Modificado"
  		redirect_to customer_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@customer = current_user.customers.find(params[:id]).destroy
  	redirect_to root_url, :notice => 'Cliente Eliminado'
  end

  def search
    @customers = current_user.customers.search(params)
    @customer = Customer.new

    if @customers.any?
      flash.now[:success] = "Cliente encontrado"
    else
      flash[:notice] = "Cliente no encontrado, agregalo"

    end

  end

end
