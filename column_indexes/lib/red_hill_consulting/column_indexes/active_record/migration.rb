module RedHillConsulting::ColumnIndexes::ActiveRecord
  module Migration
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def create_table(name, options = {})
        indexes = []
        super do |table_defintion|
          yield table_defintion          
          indexes = table_defintion.indexes
        end
        indexes.each do |column_name, index_options|
          column_names = [column_name] + Array(index_options.delete(:with))
          add_index(name, column_names, index_options)
        end unless ActiveRecord::Schema.defining?
      end

    end
  end
end
