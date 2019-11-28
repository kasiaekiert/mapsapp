class MembersController < ApplicationController

  def create
    event = Event.find(params[:event_id])
    event.members << current_user
    redirect_to event_path(event)
  end 
end
