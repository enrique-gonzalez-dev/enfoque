class AdminsController < ApplicationController
  before_action :authenticate_user_active
  before_action :permission_for_access_level_1
  before_action :permission_for_access_super_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  # GET /admins
  # GET /admins.json
  def index
    #@admins = Admin.where('id != ?', current_user.meta_id)
     #.order(id: default_regs_order)
    respond_to do |format|
      format.html
      js = AdminDatatable.new(params, current_user: current_user)
      format.json { render json: js }
    end
  end

  def profile
  end

  def dashboard
    @admin = Admin.find(current_user.meta.id)
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
    @admin.build_user
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'El usuario administrador ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @admin }
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
        format.html { redirect_to @admin, notice: 'El usuario administrador ha sido actualizado exitosamente.' }
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
      format.html { redirect_to admins_url, notice: 'El usuario administrador ha sido removido exitosamente.' }
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
      params.require(:admin).permit(:user_attributes=>[:id,:is_active,:first_name,:last_name,:surname,:username,:email,:password,:password_confirmation, :phone, :super_user])
    end
end
