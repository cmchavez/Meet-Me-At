class EmailInvitationsController < ApplicationController
  def new
  	@emailinvitation = EmailInvitation.new
  end

  def create
  	@emailinvitation = EmailInvitation.new(params[:invitation])
 	@emailinvitation.sender = current_user
  		if @emailinvitation.save
		      Mailer.deliver_invitation(@emailinvitation, signup_url(@emailinvitation.token))
		      flash[:notice] = "Thank you, invitation sent."
		      redirect_to projects_url
		    else
		      flash[:notice] = "Thank you, we will notify when we are ready."
		      redirect_to root_url
    		end
  		else
    		render :action => 'new'
    	
  end


end
