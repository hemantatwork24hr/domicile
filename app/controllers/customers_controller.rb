class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all

    respond_to do |format|
       format.html
       format.js
    end
  end

  def show

    @customer = Customer.find( params[:id] )

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
      @customer = Customer.new

      respond_to do |format|
          format.html
          format.js
      end
  end

  def edit

    @customer = Customer.find( params[:id] )
    
    respond_to do |format|
      format.html
      format.js
    end

  end

  def create

    @customer = Customer.new( customer_params )

    if @customer.save
        self.index
    else
      respond_to do |format|
          format.html
          format.js
      end
    end

  end

  def update

      if @customer.update( customer_params )       
          self.index
      else
          render 'edit'
      end

  end

  def destroy
    
    @customer.destroy
    self.index

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :phone, :email, :adhaar_id)
    end
end
