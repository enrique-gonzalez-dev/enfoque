class ApplicantsController < ApplicationController
  before_action :set_applicant, only: [:show, :edit, :update, :destroy]
  before_action :permission_for_access_level_1, except: [:new_applicant, :registry_applicant_success, :create]

  # GET /applicants
  # GET /applicants.json
  def index
    @applicants = Applicant.all
    @pending_applicants = Applicant.where(status: 0)
    @validated_applicants = Applicant.where(status: 1)
    @rejected_applicants = Applicant.where(status: 2)

  end

  # GET /applicants/1
  # GET /applicants/1.json
  def show
    @applicant_report = ApplicantReport.new(applicant_id: @applicant.id)
    @applicant_reports = ApplicantReport.where(applicant_id: @applicant.id)
  end

  # GET /applicants/new
  def new
    @applicant = Applicant.new
  end

  # GET /applicants/1/edit
  def edit
  end

  def create_applicant_report
    @applicant = Applicant.find(applicant_report_params[:applicant_id])
    @applicant_report = ApplicantReport.new(applicant_report_params)
    @applicant_report.report_img.attach(applicant_report_img_params[:report_img])
    @applicant_report.payment_img.attach(applicant_report_img_params[:payment_img])

    respond_to do |format|
      if @applicant_report.save
        format.html { redirect_to @applicant, notice: 'Reporte creado correctamente' }
        format.json { render :show, status: :created, location: @applicant }
      else
        format.html { redirect_to @applicant }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /applicants
  # POST /applicants.json
  def create
    @applicant = Applicant.new(applicant_params)
    @applicant.ine_id.attach(applicant_documents_params[:ine_id])
    @applicant.cedule_id.attach(applicant_documents_params[:cedule_id])
    @applicant.address_proof.attach(applicant_documents_params[:address_proof])

    respond_to do |format|
      if @applicant.save
        format.html { redirect_to "/registry_applicant_success", notice: 'Becario registrado correctamente' }
        format.json { render :show, status: :created, location: @applicant }
      else
        format.html { render :new_applicant }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applicants/1
  # PATCH/PUT /applicants/1.json
  def update
    @applicant.status = 0
    respond_to do |format|
      if @applicant.update(applicant_params)
        format.html { redirect_to @applicant, notice: 'Datos del becario actualizados correctamente' }
        format.json { render :show, status: :ok, location: @applicant }
      else
        format.html { render :edit }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicants/1
  # DELETE /applicants/1.json
  def destroy
    @applicant.destroy
    respond_to do |format|
      format.html { redirect_to applicants_url, notice: 'Becario eliminado correctamente' }
      format.json { head :no_content }
    end
  end

  def new_applicant
    @applicant = Applicant.new
  end

  def upload_ine_id_img
    @applicant = Applicant.find(upload_ine_id_img_params[:id])
    @applicant.ine_id.attach(upload_ine_id_img_params[:ine_id])
    @applicant.status = 0
    respond_to do |format|
      if @applicant.save
        format.html { redirect_to @applicant, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @applicant }
      else
        format.html { render :show }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_cedule_id_img
    @applicant = Applicant.find(upload_cedule_id_img_params[:id])
    @applicant.cedule_id.attach(upload_cedule_id_img_params[:cedule_id])
    @applicant.status = 0
    respond_to do |format|
      if @applicant.save
        format.html { redirect_to @applicant, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @applicant }
      else
        format.html { render :show }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_address_proof_img
    @applicant = Applicant.find(upload_address_proof_img_params[:id])
    @applicant.address_proof.attach(upload_address_proof_img_params[:address_proof])
    @applicant.status = 0
    respond_to do |format|
      if @applicant.save
        format.html { redirect_to @applicant, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @applicant }
      else
        format.html { render :show }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_applicant_status
    status = update_applicant_status_params[:status]
    message = update_applicant_status_params[:mail_comment]
    @applicant = Applicant.find(update_applicant_status_params[:id])
    @applicant.status = status
    @applicant.mail_comment = message
    @applicant.admin_id = current_user.meta.id
    if status == "1"
      UserMailer.applicant_accepted(@applicant, message).deliver_later
    elsif status == "2"
      UserMailer.applicant_rejected(@applicant, message).deliver_later
    end
    respond_to do |format|
      if @applicant.save
        format.html { redirect_to @applicant, notice: 'Estatus actualizado' }
        format.json { render :show, status: :ok, location: @applicant }
      else
        format.html { render :show }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_applicant_feedback_1_img
    @applicant = Applicant.find(upload_feedback_1_img_params[:id])
    @applicant.feedback_1.attach(upload_feedback_1_img_params[:feedback_1])
    respond_to do |format|
      if @applicant.save
        format.html { redirect_to @applicant, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @applicant }
      else
        format.html { render :show }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_applicant_feedback_2_img
    @applicant = Applicant.find(upload_feedback_2_img_params[:id])
    @applicant.feedback_2.attach(upload_feedback_2_img_params[:feedback_2])
    respond_to do |format|
      if @applicant.save
        format.html { redirect_to @applicant, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @applicant }
      else
        format.html { render :show }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_applicant_feedback_3_img
    @applicant = Applicant.find(upload_feedback_3_img_params[:id])
    @applicant.feedback_3.attach(upload_feedback_3_img_params[:feedback_3])
    respond_to do |format|
      if @applicant.save
        format.html { redirect_to @applicant, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @applicant }
      else
        format.html { render :show }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_applicant_agreement_img
    @applicant = Applicant.find(upload_agreement_img_params[:id])
    @applicant.agreement.attach(upload_agreement_img_params[:agreement])
    respond_to do |format|
      if @applicant.save
        format.html { redirect_to @applicant, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @applicant }
      else
        format.html { render :show }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_applicant_management_payment_img
    @applicant = Applicant.find(upload_management_payment_img_params[:id])
    @applicant.management_payment.attach(upload_management_payment_img_params[:management_payment])
    respond_to do |format|
      if @applicant.save
        format.html { redirect_to @applicant, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @applicant }
      else
        format.html { render :show }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicant
      @applicant = Applicant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def applicant_params
      params.require(:applicant).permit(:protest, :name, :birthday, :street, :colony, :number, :inside_number, :business_prospect, :state_id, :city_id, :zip_code, :id_code, :curp_code, :phone, :email, :social_profile,:school, :finish_date, :school_grade, :familiar_fullname, :familiar_relationship, :familiar_phone, :comments, :protest )
    end

    def applicant_documents_params
      params.require(:applicant).permit(:cedule_id, :address_proof, :ine_id)
    end

    def upload_ine_id_img_params
      params.require(:applicant).permit(:ine_id, :id)
    end

    def upload_cedule_id_img_params
      params.require(:applicant).permit(:cedule_id, :id)
    end

    def upload_address_proof_img_params
      params.require(:applicant).permit(:address_proof, :id)
    end

    def update_applicant_status_params
      params.require(:applicant).permit(:status, :id, :mail_comment)
    end

    def upload_feedback_1_img_params
      params.require(:applicant).permit(:feedback_1, :id)
    end
    def upload_feedback_2_img_params
      params.require(:applicant).permit(:feedback_2, :id)
    end
    def upload_feedback_3_img_params
      params.require(:applicant).permit(:feedback_3, :id)
    end
    def upload_agreement_img_params
      params.require(:applicant).permit(:agreement, :id)
    end
    def upload_management_payment_img_params
      params.require(:applicant).permit(:management_payment, :id)
    end

    def applicant_report_params
      params.require(:applicant_report).permit(:title, :comment, :applicant_id)
    end

    def applicant_report_img_params
      params.require(:applicant_report).permit(:report_img, :payment_img)
    end
end
