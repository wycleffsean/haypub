# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'payhub/version'

Gem::Specification.new do |spec|
  spec.name          = "haypub"
  spec.version       = Payhub::VERSION
  spec.authors       = ["Sean Carey"]
  spec.email         = ["wycleffsean@gmail.com"]

  spec.summary       = %q{Payhub API gem}
  spec.description   = %q{simple library for creating payhub bills with ruby}
  spec.homepage      = "https://github.com/wycleffsean/haypub"
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata['issue_tracker'] = "https://github.com/wycleffsean/haypub/issues"
    spec.metadata['documentation'] = "http://www.rubydoc.info/github/wycleffsean/haypub"
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "virtus", "~> 1.0.5"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "codeclimate-test-reporter"
end
