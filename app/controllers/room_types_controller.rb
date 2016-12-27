class RoomTypesController < ApplicationController

	def index

	end

	def new
		@counts = { "choose one" => "", "single" => "1", "double" => "2", "triple" => "3", "family" => "3" }		
		@roomType = RoomType.new		
	end

	def create
		@counts = { "choose one" => "", "single" => "1", "double" => "2", "triple" => "3", "family" => "3" }
		@roomType = RoomType.new( room_type_params )

		if @roomType.save
			redirect_to @roomType
		else
			render 'new'
		end

		#binding.pry
	end

	private 
		def room_type_params
			params.require(:room_type).permit(:name, :capacity, :cost, :a_c_cost)
		end
end
