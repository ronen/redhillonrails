module RedHillConsulting::ColumnIndexes::ActiveRecord::ConnectionAdapters
  module TableDefinition
    def self.included(base)
      base.class_eval do
        alias_method_chain :column, :column_indexes
      end
    end

    def column_with_column_indexes(name, type, options = {})
      column_without_column_indexes(name, type, options)
      if index_options = ActiveRecord::Base.column_index_options(name, options)
        add_index(name, index_options)
      end
      self
    end

    def add_index(column_name, options = {})
      (@indexes ||= []) << [column_name, options]
    end

    def indexes
      @indexes || []
    end

  end
end
