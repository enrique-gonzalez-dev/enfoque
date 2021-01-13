class CreateBusinessReports < ActiveRecord::Migration[5.2]
  def change
    create_table :business_reports do |t|
      t.belongs_to :business
      t.string :title
      t.text :comment
      t.timestamps
    end
  end
end
