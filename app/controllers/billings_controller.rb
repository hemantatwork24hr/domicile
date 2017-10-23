class BillingsController < ApplicationController

	def index

	end

	def edit

		@booking = Booking.find( params[:id] )

		respond_to do |format|
			format.html
			format.js	
		end

	end
end
