class FriendshipsController < ApplicationController

	def index
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

	def new
		@friendship = current_user.friendships.new
	end 
	def create
		@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
		if @friendship.save
		flash[:notice] = "Added friend."
		redirect_to root_url
		else
		flash[:error] = "Unable to add friend."
		redirect_to root_url
		end
	end

	def destroy
		@friendship = current_user.friendships.find(params[:id])
  		@friendship.destroy
  		flash[:notice] = "Removed friendship."
 		 redirect_to current_user
	end
end
