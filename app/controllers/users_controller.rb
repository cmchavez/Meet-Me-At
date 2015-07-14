class UsersController < ApplicationController
  
	def new
	  @user = User.new(:emailinvitation_token => params[:emailinvitation_token])
	  @user.email = @user.emailinvitation.recipient_email if @user.emailinvitation
	end

  	def index
  		@users = User.all
  	end

  	def show
		@user = User.find(params[:id])
  	end

  	
end
