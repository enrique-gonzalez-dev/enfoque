class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.belongs_to :admin
      t.integer :status, default: 0
      t.integer :kind
      t.string :name
      t.string :tax_cedule
      t.belongs_to :city
      t.belongs_to :state
      t.string :street
      t.string :colony
      t.string :zip_code
      t.string :phone
      t.string :email
      t.integer :minimum_grade
      t.string :quantity_employees
      t.string :required_applicants
      t.string :agent_name
      t.string :agent_id_code
      t.string :agent_phone
      t.string :agent_email
      t.integer :agent_position
      t.text :comments
      t.timestamps
    end
  end
end
