class EventsController < ApplicationController
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
    if @event.save
      @event.update(temperature:
                      (WeatherReport.get_forecast(@event.date.strftime("%Y, %m, %d")
                            ).temperature.round),
                    conditions:
                      (WeatherReport.get_forecast(@event.date.strftime("%Y, %m, %d")          
                            ).icon))
      redirect_to events_path
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
