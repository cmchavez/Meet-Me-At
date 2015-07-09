class InvitesController < ApplicationController
	before_filter :authenticate_user!

	layout false

	def create
		if Invite.between(params[:sender_id],params[:recipient_id]).present?
			@invite = Invite.between(params[:sender_id],params[:recipient_id]).first
		else
			@invite = Invite.create!(invite_params)
		end

		render json: { conversation_id: @invite.id }
	end

	def show
		@invite = Invite.find(params[:id])
		@reciever = interlocutor(@invite)
		@messages = @invite.messages
		@message = Message.new
	end

	private

	def invite_params
		params.permit(:sender_id, :recipient_id)
	end

	def interlocutor(invite) 
		current_user == invite.recipient ? invite.sender : invite.recipient
	end
end
