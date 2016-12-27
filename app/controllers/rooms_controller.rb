class RoomsController < ApplicationController
	
	def index
		@rooms = Room.all

		respond_to do |format|
			format.html
		end
	end

	def show
		@room = Room.find(params[:id])
	end

	def new
		@room = Room.new
	end

	def edit
		@room = Room.find(params[:id])
	end

	def create
		#render plain: params[:room].inspect
		#skip_before_action :verify_authenticity_token

		@room = Room.new( room_params )
		
		respond_to do |format|
			if @room.save
				# redirect_to @room
				#format.html{ redirect_to @room, notice: 'Room was successfully created'}
				#format.json{ rendor json: @room, status: 'created', location: @room }
				#format.js
			else
				format.html { render 'new' }
			end
		end
		#binding.pry
	end

	def update
		@room = Room.find(params[:id])

		if @room.update(room_params)
			redirect_to @room
		else
			render 'edit'
		end
	end

	def destroy
		@room = Room.find(params[:id])
		@room.destroy

		redirect_to rooms_path
	end

	private 
		def room_params
			params.require(:room).permit(:name, :price, :type, :num_beds, :availability, :room_floor, :room_number, :description )
		end
end
