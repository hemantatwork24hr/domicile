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
		
		@room_ids 	   = booking_params["room_ids"].map(&:to_s)
		@room_type_ids = booking_params["room_type_ids"]

		@rooms 	    = Room.all
		@room_types = RoomType.all

		@relations 	 = Hash.new{|hsh,key| hsh[key] = [] }
		@room_counts = Hash.new


		@rooms.each do |room|
			
			room_id = room.id.to_s
			puts room.room_type_id
			if @room_ids.include?(room_id)
				@relations[room.room_type_id].push(room.id)
			end
			
		end

		@relations.each do |key,values|
			@room_counts[key.to_s] = values.count
		end

		@booking.count = @room_counts

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

		@booking = Booking.find( params[:id] )

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
			params.require(:booking).permit( :check_in, :check_out, :adults, :children, :customer_id,:room_ids => [], :room_type_ids => [] )
		end
end
