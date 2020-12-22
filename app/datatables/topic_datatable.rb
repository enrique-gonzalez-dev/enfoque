class TopicDatatable < AjaxDatatablesRails::ActiveRecord
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
          id: { source: "Topic.id" },
          name: { source: "Topic.name" },
          topic_type: { source: "Topic.topic_type" },
          category: { source: "Topic.category.title" }
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
              name: record.name,
              topic_type: record.topic_type,
              category: record.category.title,
              actions: show_edit_destroy(record.id,false,"edit"),
              DT_RowId: record.id
          }
      end
  end

  def get_raw_records
    Topic.all
  end

  def filter_custom_condition
      ->(column, value) { column.table[column.field].in(column.search.value) }
  end
end
