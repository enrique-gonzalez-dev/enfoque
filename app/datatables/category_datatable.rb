class CategoryDatatable < AjaxDatatablesRails::ActiveRecord
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
          id: { source: "Category.id" },
          name: { source: "Category.title" },
          topics_count: { source: "Category.topics.count" },
          sections_count: { source: "Category.sections.count" }
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
              name: record.title,
              sections_count: record.sections.count,
              topics_count: record.topics.count,
              actions: show_edit_destroy(record.id,false,"edit"),
              DT_RowId: record.id
          }
      end
  end

  def get_raw_records
    Category.all
  end

  def filter_custom_condition
      ->(column, value) { column.table[column.field].in(column.search.value) }
  end
end
