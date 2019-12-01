class MembersController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    event.members << current_user
    redirect_back(fallback_location: root_path)
  end

  def destroy
    event = Event.find(params[:event_id])
    event.members.destroy(current_user)
    redirect_back(fallback_location: root_path)
  end
end
