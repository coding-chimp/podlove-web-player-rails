require "podlove-web-player-rails/version"
require "podlove-web-player-rails/view_helpers"
require "podlove-web-player-rails/generators/install_generator"

module PodloveWebPlayerRails
  # Loads all the needed assets and includes the View Helpers
  class Engine < ::Rails::Engine
    initializer "podlove-web-player-rails.view_helpers" do |app|
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
