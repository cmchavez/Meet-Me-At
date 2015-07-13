class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = current_user.meetings.build(:receiver_id => params[:receiver_id])
    if @meeting.save
      flash[:notice] = "Meeting scheduled."
      redirect_to root_url
    else
      flash[:notice] = "Unable to add this meeting."
      redirect_to root_url
    end
  end

  def edit
    @meeting = current_user.meetings.find(params[:id])
  end

  def update
    @meeting = current_user.meetings.find(params[:id])
    @meeting.update_attributes(meeting_params)
    redirect_to current_user
    flash[:notice] = "Contact is updated."
  end

  def destroy
    @meeting = current_user.meetings.find(params[:id])
    @meeting.destroy
    flash[:notice] = "Removed meeting."
    redirect_to current_user
  end

  private 
  def meeting_params
  params.require(:meeting).permit(:name, :location, :time, :description)
  end 
end
