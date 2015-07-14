class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
    respond_to do |format|
      format.html {
        render
      }
      format.json {
        render json: @meetings
      }
    end
  end

  def new
    @meeting = Meeting.new
  end

  def show
    @meeting = Meeting.find(params[:id])
    respond_to do |format|
      format.html {
          render
      }
      format.json {
          render json: @map
      }
  end
  end 

  def create
    @meeting = current_user.meetings.build(:receiver_id => params[:receiver_id])
    respond_to do |format|
      if @meeting.save
        format.html { redirect_to root_url, notice: 'meeting successfully created.' }
        format.json { render :show, status: :created, location: @meeting }

      else
        format.html { flash[:notice] = "Unable to add this Meetme."
        redirect_to root_url}
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @meeting = current_user.meetings.find(params[:id])
  end

  def update
    @meeting = current_user.meetings.find(params[:id])
    @meeting.update_attributes(meeting_params)
    respond_to do |format|
      format.html { redirect_to current_user
      flash[:notice] = "Meetme is updated." }
      format.json { render :show, status: :ok, location: @meeting
      }
    end 
  end

  def destroy
    @meeting = current_user.meetings.find(params[:id])
    @meeting.destroy
    respond_to do |format|
      format.html { flash[:notice] = "Meetme is now removed."
      redirect_to current_user}
      format.json {head :no_content}
    end 
  end

  private 
    def meeting_params
      params.require(:meeting).permit(:name, :location, :date, :description)
    end 
end
