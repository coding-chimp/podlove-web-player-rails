module Podlove
  module Web
    module Player
      module Rails
        module ViewHelpers
          def podloveaudio(options = {})
            html = "<audio id='player'>"
            html << "<source src='#{options[:src]}' type='#{options[:type]}'></source>"
            html << "</audio>"

            options.delete(:src)
            options.delete(:type)

            script = "$('#player').podlovewebplayer(#{options.to_json});"

            return raw html + "\n" + javascript_tag(script)
          end

          def podlovevideo(options = {})
            html = "<video id='player'>"
            html << "<source src='#{options[:src]}' type='#{options[:type]}'></source>"
            html << "</video>"

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
