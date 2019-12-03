class MembersController < ApplicationController

  def create
    event = Event.find(params[:event_id])
    event.members << current_user
    redirect_back(fallback_location: root_path)
  end

  def destroy
    event = Event.find(params[:event_id])
    event.members.destroy(current_user)
    respond_to do |format|
      format.html { redirect_to :back, notice: t('.member_destroy') }
      format.json { head :no_content }
    end
  end
end
