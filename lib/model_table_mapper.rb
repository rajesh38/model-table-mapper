require "model_table_mapper/version"

module ModelTableMapper
  def self.list(*args)
    model_files = %x(ls app/models/*.rb).split
    models = model_files.map do |file_name|
      class_statement = File.open("#{file_name}").read.match(/^class +\w+ *< *ApplicationRecord\s*/).try(:[], 0)
      class_statement.match(/class +(\w+)/).try(:[], 1) if class_statement.present?
    end.compact
    model_table_hash = models.each_with_object({}) do |model, result|
      result[model] = model.constantize.table_name
    end
    if args.present?
      filename = args[0].strip
      filename = (filename =~ /.csv$/).present? ? filename : "#{filename}.csv"
      CSV.open(filename, "wb") {|csv| csv << ['model', 'table']; model_table_hash.to_a.each {|elem| csv << elem} }
      puts "CSV output file: #{filename}"
    end
    model_table_hash
  end
end
