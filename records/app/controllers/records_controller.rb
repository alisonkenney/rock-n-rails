class RecordsController < ApplicationController

	def index
  		@records = Record.all
  		render :index
  		#render json: @records --this is how you would render json
	end

	def show
		@record = Record.find(params[:id])
    	render :show #this is optional - it will automatically render the show method
	end

	def new
		@record = Record.new
    	render :new #optional
  	end

  	def create
    	Record.create(record_params)
    	redirect_to('/records')
  	end

  	private

  	def record_params
    	params.require(:record).permit(:title, :artist, :year, :cover_art, :song_count)
  	end


end
