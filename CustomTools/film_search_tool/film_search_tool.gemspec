# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'film_search_tool/version'

Gem::Specification.new do |spec|
  spec.name          = "film_search_tool"
  spec.version       = FilmSearchTool::VERSION
  spec.authors       = ["dodoliu"]
  spec.email         = ["donliu29@gmail.com"]

  spec.summary       = "定向信息抓取"
  spec.description   = "搜集资源"
  spec.homepage      = ""
  spec.license       = "MIT"

  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
