class BookingsController < ApplicationController

	def index

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

	private

		def booking_params
			params.require(:booking).permit( :check_in, :check_out, :adults, :children, :room_id, :customer_id )
		end
end
