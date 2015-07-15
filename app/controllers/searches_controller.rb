class SearchesController < ApplicationController

	def index
		@searches = Search.all
		respond_to do |format|
			format.html {
				render
			}
			format.json {
				render json: @searches
			}
		end
	end

	def show
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

	def new
		@search = Search.new
	end 

	# def create 
	# 	@search = Search.new(params.require(:search).permit(:name, :zipcode))
	# 	@search.save
	# 	redirect_to root_url
	# end



end
