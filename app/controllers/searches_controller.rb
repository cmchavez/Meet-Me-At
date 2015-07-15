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
		
	end 

	def create 
		re
	
	end



end
