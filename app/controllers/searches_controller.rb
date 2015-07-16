class SearchesController < ApplicationController

	def index
		response = Meetupapi.find(params[:name], params[:zipcode])
		@results = response["results"]  
		respond_to do |format|
			format.html {
				render
			}
			format.json {
				render json: @results
			}
		end
	end

	# def show
	# 	response = Meetupapi.find(params[:name], params[:zipcode])

	# 	@results = response["results"] 
	# 	respond_to do |format|
	# 		format.html {
	# 			render
	# 		}
	# 		format.json {
	# 			render json: @results
	# 		}
	# 	end
	# end 

	def new
		response = Meetupapi.find(params[:name], params[:zipcode])
		@results = response["results"]
		
		
	end 

	def create 
		
	
	end



end
