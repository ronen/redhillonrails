ActiveRecord::Base.send(:include, RedHillConsulting::ColumnIndexes::ActiveRecord::Base)
ActiveRecord::Migration.send(:include, RedHillConsulting::ColumnIndexes::ActiveRecord::Migration)
ActiveRecord::ConnectionAdapters::TableDefinition.send(:include, RedHillConsulting::ColumnIndexes::ActiveRecord::ConnectionAdapters::TableDefinition)
ActiveRecord::ConnectionAdapters::SchemaStatements.send(:include, RedHillConsulting::ColumnIndexes::ActiveRecord::ConnectionAdapters::SchemaStatements)
