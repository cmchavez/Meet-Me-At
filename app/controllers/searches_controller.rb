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
		@search = Search.find(params[:id])
		espond_to do |format|
			format.html {
				render
			}
			format.json {
				render json: @search
			}
		end
	end 


end
