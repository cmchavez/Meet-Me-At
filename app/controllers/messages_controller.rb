class MessagesController < ApplicationController
	before_filter :authenticate_user!
 
  def create
    @invite = Invite.find(params[:invite_id])
    @message = @invite.messages.build(message_params)
    @message.user_id = current_user.id
    @message.save!
 
    @path = invite_path(@invite)
  end
 
  private
 
  def message_params
    params.require(:message).permit(:body)
  end
end
