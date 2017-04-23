require "model_table_mapper/version"
require "find"

module ModelTableMapper
  def self.list(*args)
    model_files = []
    Find.find('app/models') do |path|
      model_files << path if path =~ /.*\.rb/
    end
    models = model_files.map do |file_name|
      file_content = File.open("#{file_name}").read
      class_statement = file_content.match(/^class +[\w:]+ *< *(ApplicationRecord|ActiveRecord::Base)\s*/).try(:[], 0)
      class_statement.match(/class +([\w:]+)/).try(:[], 1) if class_statement.present?
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
