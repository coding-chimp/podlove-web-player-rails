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
            html << "<source src='#{options[:mp3]}' type='audio/mpeg'></source>"                 if options[:mp3]
            html << "<source src='#{options[:opus]}' type='audio/ogg; codecs=opus'></source>"    if options[:opus]
            if type == 'audio'
              html << "<source src='#{options[:mp4]}' type='audio/mp4'></source>"                if options[:mp4]
              html << "<source src='#{options[:ogg]}' type='audio/ogg; codecs=vorbis'></source>" if options[:ogg]
            end
            html << "<source src='#{options[:opus]}' type='video/webm'></source>"                if options[:webm]
            if type == 'video'
              html << "<source src='#{options[:mp4]}' type='video/mp4'></source>"                if options[:mp4]
              html << "<source src='#{options[:ogg]}' type='video/ogg'></source>"                if options[:ogg]
            end
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
