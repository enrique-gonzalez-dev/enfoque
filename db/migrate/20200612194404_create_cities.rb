class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :state_id
    end

    add_index :cities, :state_id
  end
end
