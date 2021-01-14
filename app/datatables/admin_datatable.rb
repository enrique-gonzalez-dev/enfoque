class AdminDatatable < AjaxDatatablesRails::ActiveRecord
  include FormatsHelper
  include TableButtonsHelper
  include EnumsHelper
  extend Forwardable

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def current_user
    @current_user = options[:current_user]
  end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format

    @view_columns ||= {
      id: { source: "Admin.id" },
      name: { source: "User.first_name" },
      email: { source: "User.email" },
      status: { source: "User.is_active" },
      actions: {}
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.user.fullname,
        email: record.user.try(:email),
        status: status_badge(record.user.try(:is_active)),
        actions: show_edit_destroy(record.id,false,"edit")  ,
        DT_RowId: record.id
      }
    end
  end

  def get_raw_records
    Admin.all_except(current_user.meta_id)
  end

  def filter_custom_condition
    ->(column, value) { column.table[column.field].in(column.search.value) }
  end
end
