class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :verify_if_user_can_manage?, except: [:index, :show]
  skip_before_action :authenticate_user!, only: [:show]
  layout :resolve_layout

  # GET /events
  # GET /events.json
  def index
    @events = Event.all.order(:created_at).reverse_order
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # GET /events/agenda_entry
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to new_event_agenda_entry_path(:event_id => @event.id), notice: 'Evento creado, proceda a llenar la agenda'}
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        if delete_params[:delete_registration_image]
          @event.registration_image = nil
          @event.save
          @event.registration_image.destroy
        end
        if delete_params[:delete_registration_pdf]
          @event.registration_pdf = nil
          @event.save
          @event.registration_pdf.destroy
        end
        format.html { redirect_to events_url, notice: 'Evento actualizado exitosamente' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Evento eliminado exitosamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :picture, :registration_image, :registration_pdf, :agenda_title, :sponsors_title, :speakers_title, :registration_title)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delete_params
      params.require(:event).permit(:delete_registration_image, :delete_registration_pdf)
    end

    def resolve_layout
      case action_name
      when "show"
        "application"
      else
        "dashboard"
      end
    end

    def verify_if_user_can_manage?
      redirect_to dashboard_path unless current_user.admin.can_manage_events
    end

end
