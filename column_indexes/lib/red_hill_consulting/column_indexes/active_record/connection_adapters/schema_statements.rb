module RedHillConsulting::ColumnIndexes::ActiveRecord::ConnectionAdapters
  module SchemaStatements
    def self.included(base)
      base.class_eval do
        alias_method_chain :add_column, :column_indexes
      end
    end

    def add_column_with_column_indexes(table_name, column_name, type, options = {})
      add_column_without_column_indexes(table_name, column_name, type, options)

      if index_options = ActiveRecord::Base.column_index_options(column_name, options)
        column_names = [column_name] + Array(index_options.delete(:with))
        add_index(table_name, column_names, index_options)
      end
    end

  end
end
