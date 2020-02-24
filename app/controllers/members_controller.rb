# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :set_event, only: %i[create destroy]

  def create
    event.members << current_user
    redirect_back(fallback_location: root_path)
  end

  def destroy
    event.members.destroy(current_user)
    redirect_back(fallback_location: root_path)
  end

  private

  def set_event
    event = Event.find(params[:event_id])
  end
end
