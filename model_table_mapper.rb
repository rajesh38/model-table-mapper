require 'periodic_table/version'

module ModelTableMapper
  def self.list
    model_files = %x(ls app/models/*.rb).split
    models = model_files.map do |file_name|
      class_statement = File.open("#{file_name}").read.match(/^class +\w+ *< *ApplicationRecord\s*/).try(:[], 0)
      class_statement.match(/class +(\w+)/).try(:[], 1) if class_statement.present?
    end.compact
    models.each_with_object({}) do |model, result|
      result[model] = model.constantize.table_name
    end
  end
end
