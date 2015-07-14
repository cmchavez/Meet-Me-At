class UsersController < ApplicationController
  
	def new
	  @user = User.new(:invitation_token => params[:invitation_token])
	  @user.email = @user.invitation.recipient_email if @user.invitation
	end

  	def index
  		@users = User.all
  	end

  	def show
		@user = User.find(params[:id])
  	end

  	
end
