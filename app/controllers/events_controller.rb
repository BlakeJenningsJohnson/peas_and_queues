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
      # @event.update(temperature: (Weather.report.get_forecast(time: Time.new(@event.date).to_i)).temperature)
      # @event.update(conditions: (Weather.report.get_forecast(time: Time.new(@event.date).to_i)).icon)

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
