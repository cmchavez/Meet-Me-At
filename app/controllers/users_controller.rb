class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
	@user = User.find(params[:id])
	@inverse_meetings = current_user.inverse_meetings.all
	@meetings = current_user.meetings.all
	respond_to do |format|
        		format.html {
            	render :show
        	}
        	format.json {
            render :json => {
            	:meeting => @meetings,
            	:inverse_meeting => @inverse_meetings
            	}
        	}


      	end
  end
end
