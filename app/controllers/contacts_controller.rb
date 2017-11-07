class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :verify_if_user_can_manage?, except: [:index, :show]
  layout "dashboard"

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all.order(:created_at).reverse_order
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    @contact.join_email_and_phone_arrays_into_contact! contact_params[:emails], contact_params[:phone_numbers]

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contacts_url, notice: 'El contacto fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(update_params)
        format.html { redirect_to contacts_url, notice: 'El contacto fue actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'El contacto fue eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :address, :city, :fax, :mailbox, :latitude, :longitude, {:emails => []}, {:phone_numbers => []})
    end

    def update_params
      updated = params.require(:contact).permit(:name, :address, :city, :fax, :mailbox, :latitude, :longitude)
      updated[:emails] = params.require(:contact)[:emails].join('%')
      updated[:phone_numbers] = params.require(:contact)[:phone_numbers].join('%')
      updated
    end

    def verify_if_user_can_manage?
      redirect_to dashboard_path unless current_user.admin.can_manage_contact
    end
end
