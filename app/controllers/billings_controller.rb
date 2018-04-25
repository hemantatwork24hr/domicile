class BillingsController < ApplicationController

	before_action :must_login

	def index

	end

	def edit

		@booking = Booking.find( params[:id] )
		@booking_details = Booking.collection.aggregate([
												  { "$project": { "check_in": 1, "check_out": 1, "count": 1, "customer_id": 1 } },
												  { "$match": {"_id": @booking.id } },
												  { "$lookup": {
													    "localField": "customer_id",
													    "from": "customers",
													    "foreignField": "_id",
													    "as": "userinfo"
												  } }
										  		])
		@current_date = Time.now.strftime("%d-%B-%Y %A %H:%M %p");
		@amounts = Hash.new
		@total_cost = Hash.new
		@roomTypeNames = Hash.new

		@roomTypes = RoomType.all

		@roomTypes.each do | roomType |
			@amounts[roomType._id.to_s] = roomType.price
			@roomTypeNames[roomType._id.to_s] = roomType.name
		end

		@amount_to_be_paid = 0

		@booking.count.each do |key, value|
			amount = value.to_f * @amounts[key].to_f
			@total_cost[key.to_s] = {'name' => @roomTypeNames[key], 'count' => value.to_s, 'unit_cost' => @amounts[key].to_s,'total_cost' => amount }
			@amount_to_be_paid += amount
		end

		respond_to do |format|
			format.html
			format.js
		end

	end
end
