class AddFieldsBusinessApplicants < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :inside_number, :string
    add_column :applicants, :business_prospect, :string
    add_column :businesses, :inside_number, :string
    add_column :businesses, :number, :string
    add_column :businesses, :agent_curp_code, :string

  end
end
