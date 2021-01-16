class CreateApplicantReports < ActiveRecord::Migration[5.2]
  def change
    create_table :applicant_reports do |t|
      t.belongs_to :applicant
      t.string :title
      t.text :comment
      t.timestamps
    end
  end
end
