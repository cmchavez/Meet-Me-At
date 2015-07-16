class UsersController < ApplicationController
  
	def new
	  @user = User.new(:emailinvitation_token => params[:emailinvitation_token])
	  @user.email = @user.emailinvitation.recipient_email if @user.emailinvitation
	end

  def index
  	@users = User.all_except(current_user)
  end
  	
  def show
	@user = User.find(params[:id])
      @total_meetings = []
	@inverse_meetings = current_user.inverse_meetings.all
      @inverse_meetings.each do |inverse|
        @total_meetings <<inverse
      end 
	@meetings = current_user.meetings.all
      @meetings.each do |a|
        @total_meetings << a
      end 

	respond_to do |format|
        		format.html {
            	render :show
        	}
        	format.json {
            render json: @total_meetings
        	}
      end
  end

end
