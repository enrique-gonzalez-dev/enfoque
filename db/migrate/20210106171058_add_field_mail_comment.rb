class AddFieldMailComment < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :mail_comment, :string
    add_column :businesses, :mail_comment, :string

  end
end
