class MembersController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    event.members << current_user
    redirect_back(fallback_location: root_path)
  end

  def destroy
    event = Event.find(params[:event_id])
<<<<<<< HEAD
    event.members.destroy(current_user)
=======
    event.members = current_user
    redirect_to event_members_path(event)
>>>>>>> removing whitespaces and double qunotes
    redirect_back(fallback_location: root_path)
  end
end
