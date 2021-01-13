class BusinessReportsController < ApplicationController
  before_action :set_business_report, only: [:show, :edit, :update, :destroy]

  # GET /business_reports
  # GET /business_reports.json
  def index
    if params[:id].nil?
      @business_reports = BusinessReport.all
    else
      @business_reports = BusinessReport.where(business_id: params[:id])
    end
  end
  

  # GET /business_reports/1
  # GET /business_reports/1.json
  def show
  end

  # GET /business_reports/new
  def new
    @business_report = BusinessReport.new
  end

  # GET /business_reports/1/edit
  def edit
  end

  # POST /business_reports
  # POST /business_reports.json
  def create
    @business_report = BusinessReport.new(business_report_params)
    @business_report.report_img.attach(business_report_img_params[:report_img])
    @business_report.payment_img.attach(business_report_img_params[:payment_img])

    respond_to do |format|
      if @business_report.save
        format.html { redirect_to @business_report, notice: 'Business report was successfully created.' }
        format.json { render :show, status: :created, location: @business_report }
      else
        format.html { render :new }
        format.json { render json: @business_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business_reports/1
  # PATCH/PUT /business_reports/1.json
  def update
    respond_to do |format|
      if @business_report.update(business_report_params)
        format.html { redirect_to @business_report, notice: 'Business report was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_report }
      else
        format.html { render :edit }
        format.json { render json: @business_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_reports/1
  # DELETE /business_reports/1.json
  def destroy
    @business_report.destroy
    respond_to do |format|
      format.html { redirect_to business_reports_url, notice: 'Business report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_report
      @business_report = BusinessReport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def business_report_params
      params.require(:business_report).permit(:title, :comment, :business_id)
    end

    def business_report_img_params
      params.require(:business_report).permit(:report_img, :payment_img)
    end
end
