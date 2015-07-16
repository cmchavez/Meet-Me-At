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
		@total_friends = []
		@friends = current_user.friends.all
		@friends.each do |f|
			@total_friends << f
		end
		@inverse_friends = current_user.inverse_friends.all
		@inverse_friends.each do |fv|
			@total_friends << fv
		end 
	end


end
