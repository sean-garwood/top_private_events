class EventsController < ApplicationController
  before_action :authenticate_user!
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to events_path, notice: "Event was successfully created."
    else
      flash.error[:alert] = "Event was not created."
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendance =
      @event.attendances.find_by(user: current_user) || Attendance.new
  end

  private

  def event_params
    params.require(:event).permit(:date, :id)
  end
end
