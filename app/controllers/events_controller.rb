class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :check_authorization, only: [:edit, :update, :destroy]
  
  def index
    @events = Event.includes(:members).sort_by_start_time
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params.merge(user_id: current_user.id))
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
    place_attributes = event_params[:place_attributes].merge(user_id: current_user.id)
    respond_to do |format|
      if @event.update(event_params.merge(place_attributes: place_attributes))
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

<<<<<<< HEAD
=======
    def notice_before_remove(event)
      if @event.has_member?
        flash[:notice] = 'There are some members in your event. Are you sure that you want to remove it?'
      else
        flash[:notice] = 'Are you sure?'
      end
    end
>>>>>>> 2d1d47dc28e12e5844a403f00cd2639ed29c4626
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :started_at, :duration, :place_id, place_attributes: [:name, :address])
    end
end