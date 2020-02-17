# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :check_authorization, only: %i[edit update destroy]

  def index
    @events = Event.sort_by_start_time
  end

  def show; end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = Event.new(create_event_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: t('.event_success') }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    place_attributes = update_event_params[:place_attributes].merge(user_id: current_user.id)
    respond_to do |format|
      if @event.update(update_event_params.merge(place_attributes: place_attributes))
        format.html { redirect_to @event, notice: t('.event_update') }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: t('.event_destroy') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  def check_authorization
    authorize! :manage, @event
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def create_event_params
    params.require(:event).permit(:name, :started_at, :duration, :place_id)
  end

  def update_event_params
    params.require(:event).permit(:name, :started_at, :duration, place_attributes: %i[name address])
  end
end
