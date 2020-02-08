class MembersController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    event.members << current_user
    redirect_to event_path(event)
  end

  def delete
    event = Event.find(params[:event_id])
    event.members = current_user
    redirect_to event_members_path(event)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    event = Event.find(params[:event_id])
    event.members.destroy(current_user)
    redirect_back(fallback_location: root_path)
  end
end