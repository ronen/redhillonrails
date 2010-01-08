module RedHillConsulting::ColumnIndexes::ActiveRecord
  module Base
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def column_index_options(column_name, options = {})
        column_name = column_name.to_s
        if options[:index] or options[:index_with]
          column_index = {}
          column_index[:with] = options[:index_with] if options[:index_with]
          column_index[:unique] = true if (options[:index] == :unique) || options[:unique]
          column_index[:case_sensitive] = options[:case_sensitive] if options.has_key?(:case_sensitive)
          column_index[:name] = options[:index_name] if options.has_key?(:index_name)
          column_index
        end
      end
    end
  end
end
