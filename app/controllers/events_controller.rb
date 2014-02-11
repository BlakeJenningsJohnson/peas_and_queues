class EventsController < ApplicationController
  def index
    @events = Event.all
    @events_by_date = @events.group_by(&:date)
  end
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event.id)
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :time)
  end
end
