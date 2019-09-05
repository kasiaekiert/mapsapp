class EventController < ActionController

  def index
    @events = Event.all 
  end

end