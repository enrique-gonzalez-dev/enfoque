class AddFieldsApplicantsBusinessesReports < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :internal_status, :integer
    add_column :businesses, :associated_id, :integer
    
    add_column :applicants, :internal_status, :integer
    
    add_column :business_reports, :report_date, :date
    add_column :business_reports, :amount, :float

    add_column :applicant_reports, :report_date, :date
    add_column :applicant_reports, :amount, :float

  end
end
