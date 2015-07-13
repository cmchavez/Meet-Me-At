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
      flash[:notice] = "Meetme scheduled."
      redirect_to root_url
    else
      flash[:notice] = "Unable to add this Meetme."
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
    flash[:notice] = "Meetme is updated."
  end

  def destroy
    @meeting = current_user.meetings.find(params[:id])
    @meeting.destroy
    flash[:notice] = "Meetme is now removed."
    redirect_to current_user
  end

  private 
  def meeting_params
  params.require(:meeting).permit(:name, :location, :time, :description)
  end 
end
