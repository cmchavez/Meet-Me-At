class MeetingsController < ApplicationController
  def index
    @meetings = current_user.meetings.all
    respond_to do |format|
      format.html {
        render
      }
      format.json {
        render json: @meetings
      }
    end
  end

    def show
    @meeting = current_user.meetings.find(params[:id])
    respond_to do |format|
      format.html {
          render
      }
      format.json {
          render json: @meeting
      }
  end
  end 

  def new
    @total_friends = []
    @friends = current_user.friends.all
    @friends.each do |f|
      @total_friends << f
    end
    @inverse_friends = current_user.inverse_friends.all
    @inverse_friends.each do |fv|
      @total_friends << fv
    end 
    @meeting = current_user.meetings.build
  end



  def create
    @meeting = current_user.meetings.build(meeting_params)
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
      params.require(:meeting).permit(:name, :location, :date, :description, :user_id, :receiver_id)
    end 

end
