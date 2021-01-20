class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]
  before_action :permission_for_access_level_1, only: [:show, :new, :edit, :index, :destroy]

  # GET /businesses
  # GET /businesses.json
  def index
    @businesses = Business.all
    @pending_businesses = Business.where(status: 0)
    @validated_businesses = Business.where(status: 1)
    @rejected_businesses = Business.where(status: 2)

  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
    @business_report = BusinessReport.new(business_id: @business.id)
    @business_reports = BusinessReport.where(business_id: @business.id)
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
  end

  def registry_success
  end

  def create_business_report
    @business = Business.find(business_report_params[:business_id])
    @business_report = BusinessReport.new(business_report_params)
    @business_report.report_img.attach(business_report_img_params[:report_img])
    @business_report.payment_img.attach(business_report_img_params[:payment_img])

    respond_to do |format|
      if @business_report.save
        format.html { redirect_to @business, notice: 'Reporte creado correctamente' }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { redirect_to @business }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /businesses
  # POST /businesses.json
  def create
    @business = Business.new(business_params)
    @business.taxes_id.attach(business_documents_params[:taxes_id])
    @business.internal_img.attach(business_documents_params[:internal_img])
    @business.external_img.attach(business_documents_params[:external_img])
    @business.proof_residency.attach(business_documents_params[:proof_residency])

    @business.official_id.attach(business_documents_params[:official_id])
    @business.agent_proof.attach(business_documents_params[:agent_proof])
    @business.agent_selfie.attach(business_documents_params[:agent_selfie])

    respond_to do |format|
      if @business.save
        format.html { redirect_to "/registry_success", notice: 'Centro de trabajo creado correctamente' }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new_business }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update
    respond_to do |format|
      @business.status = 0
      if @business.update(business_params)
        format.html { redirect_to @business, notice: 'Centro de trabajo actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_taxes_img
    @business = Business.find(upload_taxes_img_params[:id])
    @business.taxes_id.attach(upload_taxes_img_params[:taxes_id])
    @business.status = 0
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :show }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_internal_img
    @business = Business.find(upload_internal_img_params[:id])
    @business.internal_img.attach(upload_internal_img_params[:internal_img])
    @business.status = 0
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :show }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_external_img
    @business = Business.find(upload_external_img_params[:id])
    @business.external_img.attach(upload_external_img_params[:external_img])
    @business.status = 0
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :show }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_proof_residency_img
    @business = Business.find(upload_proof_residency_img_params[:id])
    @business.proof_residency.attach(upload_proof_residency_img_params[:proof_residency])
    @business.status = 0
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :show }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_official_id_img
    @business = Business.find(upload_official_id_img_params[:id])
    @business.official_id.attach(upload_official_id_img_params[:official_id])
    @business.status = 0
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :show }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_official_back_id_img
    @business = Business.find(upload_official_back_id_img_params[:id])
    @business.official_back_id.attach(upload_official_back_id_img_params[:official_back_id])
    @business.status = 0
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :show }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_notarial_document_img
    @business = Business.find(upload_notarial_document_img_params[:id])
    @business.notarial_document.attach(upload_notarial_document_img_params[:notarial_document])
    @business.status = 0
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :show }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_agent_proof_img
    @business = Business.find(upload_agent_proof_img_params[:id])
    @business.agent_proof.attach(upload_agent_proof_img_params[:agent_proof])
    @business.status = 0
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :show }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_agent_selfie_img
    @business = Business.find(upload_agent_selfie_img_params[:id])
    @business.agent_selfie.attach(upload_agent_selfie_img_params[:agent_selfie])
    @business.status = 0
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :show }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_feedback_1_img
    @business = Business.find(upload_feedback_1_img_params[:id])
    @business.feedback_1.attach(upload_feedback_1_img_params[:feedback_1])
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :show }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_feedback_2_img
    @business = Business.find(upload_feedback_2_img_params[:id])
    @business.feedback_2.attach(upload_feedback_2_img_params[:feedback_2])
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :show }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_feedback_3_img
    @business = Business.find(upload_feedback_3_img_params[:id])
    @business.feedback_3.attach(upload_feedback_3_img_params[:feedback_3])
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :show }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_agreement_img
    @business = Business.find(upload_agreement_img_params[:id])
    @business.agreement.attach(upload_agreement_img_params[:agreement])
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :show }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_advance_payment_img
    @business = Business.find(upload_advance_payment_img_params[:id])
    @business.advance_payment.attach(upload_advance_payment_img_params[:advance_payment])
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :show }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_training_plan_img
    @business = Business.find(upload_training_plan_img_params[:id])
    @business.training_plan.attach(upload_training_plan_img_params[:training_plan])
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :show }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_verified_business_img
    @business = Business.find(upload_verified_business_img_params[:id])
    @business.verified_business.attach(upload_verified_business_img_params[:verified_business])
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :show }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_settlement_payment_img
    @business = Business.find(upload_settlement_payment_img_params[:id])
    @business.settlement_payment.attach(upload_settlement_payment_img_params[:settlement_payment])
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :show }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_status
    status = update_status_params[:status]
    message = update_status_params[:mail_comment]
    @business = Business.find(update_status_params[:id])
    @business.status = status
    @business.mail_comment = message
    @business.admin_id = current_user.meta.id
    if status == "1"
      UserMailer.business_accepted(@business, message).deliver_later
    elsif status == "2"
      UserMailer.business_rejected(@business, message).deliver_later
    end
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Estatus actualizado' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :show }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url, notice: 'Centro de trabajo eliminado correctamente' }
      format.json { head :no_content }
    end
  end
  def new_business
    @business = Business.new

  end

  def catch_city
    @state = State.find(catch_city_params[:state_id])
    respond_to do |format|
      format.json { render "catch_city.json" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def business_params
      params.require(:business).permit( :admin_id, :kind, :name, :tax_cedule, :city_id, :state_id, :number, :inside_number, :street, :colony, :zip_code, :phone, :email, :minimum_grade, :quantity_employees, :required_applicants, :agent_name, :agent_id_code, :agent_phone, :agent_email, :agent_position, :agent_curp_code, :comments)
    end

    def catch_city_params
      params.require(:catch_city).permit(:state_id)
    end

    def upload_internal_img_params
      params.require(:business).permit(:internal_img, :id)
    end

    def upload_external_img_params
      params.require(:business).permit(:external_img, :id)
    end

    def upload_taxes_img_params
      params.require(:business).permit(:taxes_id, :id)
    end

    def upload_proof_residency_img_params
      params.require(:business).permit(:proof_residency, :id)
    end

    def upload_official_id_img_params
      params.require(:business).permit(:official_id, :id)
    end

    def upload_official_back_id_img_params
      params.require(:business).permit(:official_back_id, :id)
    end

    def upload_notarial_document_img_params
      params.require(:business).permit(:notarial_document, :id)
    end

    def upload_agent_proof_img_params
      params.require(:business).permit(:agent_proof, :id)
    end

    def upload_agent_selfie_img_params
      params.require(:business).permit(:agent_selfie, :id)
    end

    def upload_feedback_1_img_params
      params.require(:business).permit(:feedback_1, :id)
    end
    def upload_feedback_2_img_params
      params.require(:business).permit(:feedback_2, :id)
    end
    def upload_feedback_3_img_params
      params.require(:business).permit(:feedback_3, :id)
    end
    def upload_training_plan_img_params
      params.require(:business).permit(:training_plan, :id)
    end

    def upload_agreement_img_params
      params.require(:business).permit(:agreement, :id)
    end

    def upload_advance_payment_img_params
      params.require(:business).permit(:advance_payment, :id)
    end

    def upload_verified_business_img_params
      params.require(:business).permit(:verified_business, :id)
    end
    def upload_settlement_payment_img_params
      params.require(:business).permit(:settlement_payment, :id)
    end

    def business_documents_params
      params.require(:business).permit(:taxes_id, :internal_img, :external_img, :proof_residency, :official_id, :official_back_id, :notarial_document, :agent_proof, :agent_selfie)
    end

    def update_status_params
      params.require(:business).permit(:status, :id, :mail_comment)
    end

    def business_report_params
      params.require(:business_report).permit(:title, :comment, :business_id)
    end

    def business_report_img_params
      params.require(:business_report).permit(:report_img, :payment_img)
    end
end

