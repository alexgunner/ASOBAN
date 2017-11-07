class AgendaEntriesController < ApplicationController
  before_action :set_agenda_entry, only: [:show, :edit, :update, :destroy]
  before_action :verify_if_user_can_manage?, except: [:index, :show]
  layout 'dashboard'
  # GET /event_agenda_entries
  # GET /event_agenda_entries.json
  def index
    @event = Event.find(params[:event_id])
    @agenda_entries = @event.agenda_entry.order(:created_at).reverse_order
  end

  # GET /agenda_entries/1
  # GET /agenda_entries/1.json
  def show
  end

  # GET /agenda_entries/new
  def new
    @agenda_entry = AgendaEntry.new
    @event = Event.find(params[:event_id])
  end

  # GET /agenda_entries/1/edit
  def edit
  end


  # POST /agenda_entries
  # POST /agenda_entries.json
  def create
    @agenda_entry = AgendaEntry.new(agenda_entry_params)
    @event = Event.find(params[:event_id])
    respond_to do |format|
      if @agenda_entry.save
        format.html { redirect_to new_event_agenda_entry_path(:event_id => @event.id), notice: 'Entrada ingresada exitosamente, si desea ingrese la siguiente.' }
        format.json { render :show, status: :created, location: @agenda_entry }
      else
        format.html { render :new }
        format.json { render json: @agenda_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agenda_entries/1
  # PATCH/PUT /agenda_entries/1.json
  def update
    respond_to do |format|
      if @agenda_entry.update(agenda_entry_params)
        format.html { redirect_to event_agenda_entries_path(@event), notice: 'Entrada de agenda actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @agenda_entry }
      else
        format.html { render :edit }
        format.json { render json: @agenda_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agenda_entries/1
  # DELETE /agenda_entries/1.json
  def destroy
    @agenda_entry.destroy
    respond_to do |format|
      format.html { redirect_to event_agenda_entries_url(:event_id => @event.id), notice: 'Entrada de agenda eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agenda_entry
      @agenda_entry = AgendaEntry.find(params[:id])
      @event = @agenda_entry.event
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agenda_entry_params
      params.require(:agenda_entry).permit(:pdf, :event_id, :title)
    end

    def verify_if_user_can_manage?
      redirect_to dashboard_path unless current_user.admin.can_manage_events
    end
end
