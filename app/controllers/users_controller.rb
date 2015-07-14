class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
	@user = User.find(params[:id])
	@meetings = current_user.meetings.all
	respond_to do |format|
        		format.html {
            	render :show
        	}
        	format.json {
            render json: @meetings
        	}
      end
  end
end
