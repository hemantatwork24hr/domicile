class BookingsController < ApplicationController

	def index

		@bookings 	= Booking.all
		@rooms 		= Room.all
		@customers 	= Customer.all

		respond_to do |format|
			format.html
			format.js
		end
	end

	def create
		
		@booking = Booking.new( booking_params )
		binding.pry
		if @booking.save
			self.index
		else 
			respond_to do |format|
				format.html
				format.js
			end
		end	
	end

	def new 

		@booking = Booking.new

		respond_to do |format|
			format.html
			format.js
		end

	end

	def edit
		@booking = Booking.find( params[:id] )

		respond_to do |format|
			format.html
			format.js
		end
	end

	def update 

		@booking = Booking.find( parms[:id] )

		if @booking.update
			self.index
		else
			render 'edit'
		end
	end

	def destroy

		@booking = Booking.find( params[:id] )

		@booking.destroy

		self.index

	end

	private

		def booking_params
			params.require(:booking).permit( :check_in, :check_out, :adults, :children, :customer_id, :room_ids => [], :room_type_ids => [] )
		end
end
