class ApplicantReportsController < ApplicationController
  before_action :set_applicant_report, only: [:show, :edit, :update, :destroy]
  before_action :permission_for_access_level_1



  # GET /applicant_reports
  # GET /applicant_reports.json
  def index
    if params[:id].nil?
      @applicant_reports = ApplicantReport.all
    else
      @applicant_reports = ApplicantReport.where(applicant_id: params[:id])
    end
  end

  # GET /applicant_reports/1
  # GET /applicant_reports/1.json
  def show
  end

  # GET /applicant_reports/new
  def new
    @applicant_report = ApplicantReport.new
  end

  # GET /applicant_reports/1/edit
  def edit
  end

  # POST /applicant_reports
  # POST /applicant_reports.json
  def create
    @applicant_report = ApplicantReport.new(applicant_report_params)
    @applicant_report.report_img.attach(applicant_report_img_params[:report_img])
    @applicant_report.payment_img.attach(applicant_report_img_params[:payment_img])
    respond_to do |format|
      if @applicant_report.save
        format.html { redirect_to @applicant_report, notice: 'Reporte de becario creado correctamente.' }
        format.json { render :show, status: :created, location: @applicant_report }
      else
        format.html { render :new }
        format.json { render json: @applicant_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applicant_reports/1
  # PATCH/PUT /applicant_reports/1.json
  def update
    respond_to do |format|
      if @applicant_report.update(applicant_report_params)
        format.html { redirect_to @applicant_report, notice: 'Reporte de becario actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @applicant_report }
      else
        format.html { render :edit }
        format.json { render json: @applicant_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicant_reports/1
  # DELETE /applicant_reports/1.json
  def destroy
    @applicant_report.destroy
    respond_to do |format|
      format.html { redirect_to applicant_reports_url, notice: 'Reporte de becario eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  def upload_report_img
    @applicant_report = ApplicantReport.find(upload_report_img_params[:id])
    @applicant_report.report_img.attach(upload_report_img_params[:report_img])
    respond_to do |format|
      if @applicant_report.save
        format.html { redirect_to @applicant_report, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @applicant_report }
      else
        format.html { render :show }
        format.json { render json: @applicant_report.errors, status: :unprocessable_entity }
      end
    end
  end
  def upload_payment_img
    @applicant_report = ApplicantReport.find(upload_payment_img_params[:id])
    @applicant_report.payment_img.attach(upload_payment_img_params[:payment_img])
    respond_to do |format|
      if @applicant_report.save
        format.html { redirect_to @applicant_report, notice: 'Imagen guardada correctamente' }
        format.json { render :show, status: :ok, location: @applicant_report }
      else
        format.html { render :show }
        format.json { render json: @applicant_report.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicant_report
      @applicant_report = ApplicantReport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def applicant_report_params
      params.require(:applicant_report).permit(:title, :comment, :applicant_id)
    end

    def applicant_report_img_params
      params.require(:applicant_report).permit(:report_img, :payment_img)
    end

    def upload_report_img_params
      params.require(:applicant_report).permit(:report_img, :id)
    end
    def upload_payment_img_params
      params.require(:applicant_report).permit(:payment_img, :id)
    end
end
