class TestDatatable < AjaxDatatablesRails::ActiveRecord
  include FormatsHelper
  include TableButtonsHelper
  extend Forwardable
  
  def initialize(params, opts = {})
      @view = opts[:view_context]
      super
  end

  def view_columns
      # Declare strings in this format: ModelName.column_name
      # or in aliased_join_table.column_name format
      @view_columns ||= {
          id: { source: "Test.id" },
          name: { source: "Test.name" },
          created_at: { source: "Test.created_at" }
        }
  end
  
  def data
      records.map do |record|
          date = "--"
          if !record.created_at.nil?
              date = record.created_at.strftime("%d/%m/%Y %H:%M")
          end
          {
              id: record.id,
              name: record.try(:name),
              created_at: date,
              actions: show_edit_destroy(record.id,false,"edit"),
              DT_RowId: record.id
          }
      end
  end

  def get_raw_records
    Test.all
  end

  def filter_custom_condition
      ->(column, value) { column.table[column.field].in(column.search.value) }
  end
end
