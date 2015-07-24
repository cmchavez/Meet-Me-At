class EmailInvitationsController < ApplicationController
  def new
  	@emailinvitation = EmailInvitation.new
  end

  def create
  	@emailinvitation = EmailInvitation.new(emailinvitation_params)
 	@emailinvitation.sender = current_user
  		if @emailinvitation.save
		      Mailer.emailinvitation(@emailinvitation, users_path(@emailinvitation.token)).deliver_now  
		      flash[:notice] = "Thank you, invitation sent."
		      redirect_to users_path
  		else
    		render :action => 'new'
            flash[:notice] = "This email address is already registered"

    	end 
    	
  end

  private
	def emailinvitation_params
		params.require(:email_invitation).permit(:sender_id, :recipient_email, :token, :sent_at)
	end


end
