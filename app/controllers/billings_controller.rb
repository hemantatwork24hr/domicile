class BillingsController < ApplicationController

	def index

	end

	def edit

		@booking = Booking.find( params[:id] )
		@booking_details = Booking.collection.aggregate([
												  { "$project": { "check_in": 1, "check_out": 1, "count": 1, "userinfo": 1 } },
												  { "$match": {"_id": @booking.id } },
												  { "$lookup": {
													    "localField": "customer_id",
													    "from": "customers",
													    "foreignField": "_id",
													    "as": "userinfo"
												  } }
										  		])

		respond_to do |format|
			format.html
			format.js
		end

	end
end
