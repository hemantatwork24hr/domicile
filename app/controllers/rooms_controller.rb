class RoomsController < ApplicationController
	
	before_action :must_login


	def index
		@rooms 		= Room.all
		@roomTypes 	= RoomType.all

		respond_to do |format|
			format.html
			format.js
		end
	end

	def show
		@room = Room.find(params[:id])

		respond_to do |format|
			format.html
			format.js
		end
	end

	def new
		@room = Room.new

		respond_to do |format|
			format.html
			format.js
		end
	end

	def edit
		@room = Room.find(params[:id])

		respond_to do |format|
			format.html
			format.js
		end
	end

	def create

		@room = Room.new( room_params )

		if @room.save
			self.index
		else
			respond_to do |format|
				format.html { render partial: 'new' }
				format.js
			end
		end

	end

	def update

		@room = Room.find( params[:id] )

		if @room.update( room_params )
			self.index
		else
			render 'edit'
		end

	end

	def destroy
		@room = Room.find(params[:id])
		@room.destroy

		self.index
	end

  	def search

    	@room_type_ids = params[:room_type_ids]
    	
    	@rooms = Room.where( :room_type_id =>{ "$in" => @room_type_ids } )

    	respond_to do |format|
    		format.html { render partial: 'search'  }
		end

  	end

  	def search_by_room_type_id

  		@room_type_id = params[:room_type_id]

  		@rooms = Room.where( :room_type_id => @room_type_id )

  		respond_to do |format|
  			format.html { render partial: 'search' }
		end

	end

	private 
		def room_params
			params.require(:room).permit( :room_number, :room_type_id, :availability, :room_floor )
		end
		
end
