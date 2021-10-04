# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'model_table_mapper/version'

Gem::Specification.new do |spec|
  spec.name          = "model_table_mapper"
  spec.version       = ModelTableMapper::VERSION
  spec.authors       = ["Rajesh Paul"]
  spec.email         = ["rajesh.093038@gmail.com"]

  spec.summary       = %q{Ruby gem to list all models with their corrsponding table in the database}
  spec.description   = %q{Ruby gem to list all models with their corrsponding table in the database}
  spec.homepage      = "https://github.com/rajesh38/model-table-mapper"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency 'rspec'

  spec.add_dependency "bundler", ">= 2.2.10"
end
