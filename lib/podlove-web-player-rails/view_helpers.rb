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
            html << "<source src='#{options[:src]}'"\
                    "" + (options[:type] ? " type='#{options[:type]}'" : "") + "></source>"      if options[:src]
            html << "<source src='#{options[:mp4]}' type='#{type}/mp4'></source>"                if options[:mp4]
            html << "<source src='#{options[:mp3]}' type='#{type}/mpeg'></source>"               if options[:mp3]
            html << "<source src='#{options[:ogg]}' type='#{type}/ogg; codecs=vorbis'></source>" if options[:ogg]
            html << "<source src='#{options[:opus]}' type='#{type}/ogg; codecs=opus'></source>"  if options[:opus]
            html << "<source src='#{options[:opus]}' type='#{type}/webm'></source>"              if options[:webm]
            html << "</#{type}>"

            [:src, :type, :mp4, :mp3, :ogg, :opus, :webm].each{ |key| options.delete(key) }

            script = "$('#player').podlovewebplayer(#{options.to_json});"

            return raw html + "\n" + javascript_tag(script)
          end
        end
      end
    end
  end
end
