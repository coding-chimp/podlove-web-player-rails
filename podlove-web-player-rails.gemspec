# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'podlove-web-player-rails/version'

Gem::Specification.new do |gem|
  gem.name          = "podlove-web-player-rails"
  gem.version       = Podlove::Web::Player::Rails::VERSION
  gem.authors       = ["Bastian Bartmann"]
  gem.email         = ["xarfai27@gmail.com"]
  gem.description   = %q{Podlove Web Player for Rails 3.}
  gem.summary       = %q{Integrates the needed javascript and css in the asset pipeline and provides a handy helper method to integrate the player in the view.}
  gem.homepage      = "https://github.com/coding-chimp/podlove-web-player-rails"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec"
  gem.add_dependency "railties", "~> 3.1"
end
