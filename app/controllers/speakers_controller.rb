class SpeakersController < ApplicationController
  before_action :set_speaker, only: [:show, :edit, :update, :destroy]
  before_action :verify_if_user_can_manage?, except: [:index, :show]
  layout 'dashboard'
  # GET /speakers
  # GET /speakers.json
  def index
    @event = Event.find(params[:event_id])
    @speakers = @event.speakers.order(:created_at).reverse_order
  end

  # GET /speakers/1
  # GET /speakers/1.json
  def show
  end

  # GET /speakers/new
  def new
    @speaker = Speaker.new
    @event = Event.find(params[:event_id])
  end

  # GET /speakers/1/edit
  def edit
  end

  # POST /speakers
  # POST /speakers.json
  def create
    @speaker = Speaker.new(speaker_params)
    @event = Event.find(params[:event_id])
    respond_to do |format|
      if @speaker.save
        format.html { redirect_to new_event_speaker_path(:event_id => @event.id), notice: 'Conferencista ingresado exitosamente, si desea ingrese el siguiente.' }
        # format.html { redirect_to @speaker, notice: 'Speaker was successfully created.' }
        format.json { render :show, status: :created, location: @speaker }
      else
        format.html { render :new }
        format.json { render json: @speaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /speakers/1
  # PATCH/PUT /speakers/1.json
  def update
    respond_to do |format|
      if @speaker.update(speaker_params)
        format.html { redirect_to event_speakers_url(@speaker), notice: 'Conferencista actualizado exitosamente' }
        format.json { render :show, status: :ok, location: @speaker }
      else
        format.html { render :edit }
        format.json { render json: @speaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /speakers/1
  # DELETE /speakers/1.json
  def destroy
    @speaker.destroy
    respond_to do |format|
      format.html { redirect_to event_speakers_url, notice: 'Conferencista eliminado correctamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_speaker
      @speaker = Speaker.find(params[:id])
      @event = @speaker.event
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def speaker_params
      params.require(:speaker).permit(:title, :image, :pdf, :event_id)
    end

    def verify_if_user_can_manage?
      redirect_to dashboard_path unless current_user.admin.can_manage_events
    end
end
