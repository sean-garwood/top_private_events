class EventsController < ApplicationController
  before_action :authenticate_user!
  # confirm creator actually wants to delete
  before_action :authorize_creator, only: [ :destroy ]

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

  # allow creator to update event
  def edit
    @event = current_user.created_events.find(params[:id])
    if @event.nil?
      flash.error[:alert] = "Event was not found."
      redirect_to events_path
    end
  end

  def update
    @event = current_user.created_events.find(params[:id])
    if @event.nil?
      flash[:alert] = "Event was not found."
      redirect_to events_path
    else
      if @event.update(event_params)
        redirect_to event_path(@event), notice: "Event was successfully updated."
      else
        flash[:alert] = "Event was not updated."
        render :edit
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.future? && @event.creator == current_user
      @event.destroy
      redirect_to events_path, notice: "Event was successfully destroyed."
    else
      redirect_to events_path, alert: "Event was not destroyed."
    end
  end

  private

  def event_params
    params.fetch(:event, {}).permit(:date, :id)
  end
end
