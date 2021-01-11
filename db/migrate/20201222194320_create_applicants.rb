class CreateApplicants < ActiveRecord::Migration[5.2]
  def change
    create_table :applicants do |t|
      t.belongs_to :admin
      t.integer :status, default: 0
      t.string :name
      t.date :birthday
      t.date :finish_date
      t.string :street
      t.string :number
      t.string :colony
      t.belongs_to :state
      t.belongs_to :city
      t.string :zip_code
      t.string :id_code
      t.string :curp_code
      t.string :phone
      t.string :email
      t.string :social_profile
      t.integer :school_grade
      t.string :school
      t.string :familiar_fullname
      t.string :familiar_relationship
      t.string :familiar_phone
      t.string :comments
      t.boolean :protest, default: false
      t.timestamps
    end
  end
end
