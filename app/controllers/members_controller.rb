class MembersController < ApplicationController

  def create
    event = Event.find(params[:event_id])
    event.members << current_user
    redirect_to event_path(event)
  end

  def delete
    event = Event.find(params[:event_id])
    event.member = current_user
    redirect_to event_members_path(event)
  end 
end
