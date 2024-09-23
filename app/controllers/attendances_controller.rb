class AttendancesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @attendance = @event.attendances.build(user: current_user)

    if @attendance.save
      redirect_to event_path(@event), notice: "You are now attending this event."
    else
      redirect_to event_path(@event), alert: "You are not attending this event."
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @attendance = @event.attendances.find_by(user: current_user)

    if @attendance&.destroy
      redirect_to event_path(@event), notice: "You are no longer attending this event."
    else
      redirect_to event_path(@event), alert: "unable to attend this event."
    end
  end
end
