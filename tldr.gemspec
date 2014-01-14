# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tldr/version'

Gem::Specification.new do |spec|
  spec.name          = "toolong-dontread"
  spec.version       = Tldr::VERSION

  spec.authors       = ["Jamie Wright"]
  spec.email         = ["jamie@brilliantfantastic.com"]

  spec.summary       = "Enable unsubscribe links in your email"
  spec.description   = %q{
                        Some of your users don't want to hear from you or your shitty application. 
                        You can add unsubscribe links to your mail views so that your users can relieve themselves of the pain you have endured on them.
                       }

  spec.homepage      = "http://github.com/brilliantfantastic/tldr"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rake"
  spec.add_dependency "activerecord"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "coveralls"
end
