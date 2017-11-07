class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action :verify_if_user_can_manage?
  layout 'dashboard'

  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all.order(:created_at).reverse_order
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
    @user = @admin.user
  end

  # GET /admins/new
  def new
    @admin = Admin.new
    @user = User.new
  end

  # GET /admins/1/edit
  def edit
    @user = @admin.user
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)
    @user = User.new(user_params)
    @user.password = Devise.friendly_token
    @user.valid?
    respond_to do |format|
      if @admin.valid?
        @admin.save!
        @user.admin_id = @admin.id
        if @user.valid?
          token = @user.send(:set_reset_password_token)
          @user.save!
          UserMailer.welcome_message(@user, token).deliver_later
          format.html { redirect_to admins_url, notice: 'Admin fue creado exitosamente.' }
          format.json { render :show, status: :created, location: @admin }
        else
          @admin.destroy
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to admins_url, notice: 'Admin fue editado exitosamente.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Admin fue eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:first_name, :last_name, :can_manage_contact, :can_manage_faq, :can_manage_about, :can_manage_articles, :can_manage_events, :can_manage_links, :can_manage_multimedia, :can_manage_carousel, :can_manage_newsletter, :can_manage_admins ,:can_manage_boxes, :can_manage_categories, :can_manage_messages)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email)
    end

    def verify_if_user_can_manage?
      redirect_to dashboard_path unless current_user.admin.can_manage_admins
    end
end
