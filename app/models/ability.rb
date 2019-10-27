# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
      @event = Event.find(params[:id])
      user ||= current_user
      if current.events.find(params[:id])?
        can :edit, :update, :destroy
      else
        can :read
      end
    
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
