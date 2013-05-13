module Podlove
  module Web
    module Player
      module Rails
        module ViewHelpers
          def podloveaudio(options = {})
            podlove("audio", options)
          end

          def podlovevideo(options = {})
            podlove("video", options)
          end

          private

          def podlove(type, options = {})
            html = "<#{type} id='player'>"
            html << "<source src='#{options[:src]}' type='#{options[:type]}'></source>"
            html << "</audio>"

            options.delete(:src)
            options.delete(:type)

            script = "$('#player').podlovewebplayer(#{options.to_json});"

            return raw html + "\n" + javascript_tag(script)
          end
        end
      end
    end
  end
end
