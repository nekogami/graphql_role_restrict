# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'graphql_role_restrict/version'

Gem::Specification.new do |spec|
  spec.name          = "graphql_role_restrict"
  spec.version       = GraphqlRoleRestrict::VERSION
  spec.authors       = ["François TCHENG"]
  spec.email         = ["tcheng.f@gmail.com"]

  spec.summary       = %q{Simple Field/Argument authorization layer for the gem graphql}
  spec.description   = %q{Simple plugin to allow hiding fields/arguments depending on query context}
  spec.homepage      = "https://github.com/nekogami/graphql_role_restrict"
  spec.license       = "MIT"

  spec.files         = Dir["./lib/**/*.rb"]

  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", '~> 2'
  spec.add_development_dependency "rake", '~> 13'
  spec.add_development_dependency "rspec", '~> 3'
end
