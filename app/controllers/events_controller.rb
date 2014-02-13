class EventsController < ApplicationController
  before_action :find_event, only: [:rsvp, :edit, :update]


  def index
    @events = Event.all
    @events_by_date = @events.group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.host_id = current_user.id
    if @event.save
      weather = WeatherReport.get_forecast('Time.new(@event.date.strftime("%Y, %m, %d")')
      @event.update(temperature: weather.temperature.round, conditions: weather.icon, time: @event.time.strftime("%I:%M:%S %p"))
      redirect_to events_path
    else
      render :new
    end
  end

  def edit
    redirect_to events_path unless current_user.id == @event.host_id
  end

  def update
    if @event.update(event_params)
      redirect_to events_path
    end
  end

  def rsvp
    Event.add_events(current_user, @event)
    redirect_to :back
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :date, :time, :conditions, :temperature, :host_id)
  end
end
