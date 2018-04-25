class RoomTypesController < ApplicationController

	before_action :must_login

	def index

		@roomTypes = RoomType.all

		respond_to do |format|
			format.html
			format.js
		end
	end

	def new		
		@roomType = RoomType.new

		respond_to do |format|
			format.html
			format.js
		end
	end

	def create
		
		@roomType = RoomType.new( room_type_params )

		if @roomType.save
			self.index
		else
			respond_to do |format|
				format.html{ render partial: 'new' }
				format.js
			end	
		end
	end

	def edit

		@roomType = RoomType.find( params[:id] )

		respond_to do |format|
			format.html
			format.js
		end
	end

	def update

		@roomType = RoomType.find( params[:id])

		if @roomType.update( room_type_params )
			self.index
		else
			render 'edit'
		end
	end

	def show

		@roomType = RoomType.find( params[:id] )

		respond_to do |format|
			format.html
			format.js
		end
	end

	private 
		def room_type_params
			params.require(:room_type).permit(:name, :price, :number_of_beds, :ac, :description)
		end
end
