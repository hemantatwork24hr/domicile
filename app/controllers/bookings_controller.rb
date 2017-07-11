class BookingsController < ApplicationController

	def index

	end

	def create

		@booking = Booking.new( booking_params )

	end

	def new 

		@booking = Booking.new

		respond_to do |format|
			format.html
			format.js
		end

	end

	private

		def room_params
			params.require(:booking).permit( :check_in, :check_out, :adults, :children, :room_number, :customer_id )
		end
end
