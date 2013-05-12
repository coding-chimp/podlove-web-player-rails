require "podlove-web-player-rails/version"
require "podlove-web-player-rails/view_helpers"

module Podlove
  module Web
    module Player
      module Rails
        class Engine < ::Rails::Engine
          initializer "podlove-web-player-rails.view_helpers" do |app|
            ActionView::Base.send :include, ViewHelpers
          end
        end
      end
    end
  end
end
