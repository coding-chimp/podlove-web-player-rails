module PodloveWebPlayerRails
  # View Helpers that generate the needed HTML and JS needed for the Web Player
  module ViewHelpers
    # Generates the HTML markup needed for the podlove audio player and calls the podlovewebplayer
    # js method with given option parameters.
    #
    # @param [Hash] options options for the player
    # @option options [String]  :src The location of an audio file, local ore remote.
    # @option options [String]  :type The media type of the resource.
    # @option options [String]  :mp4 The location of an audio file with the type mp4.
    # @option options [String]  :mp3 The location of an audio file with the type mp3.
    # @option options [String]  :ogg The location of an audio file with the type ogg.
    # @option options [String]  :opus The location of an audio file with the type opus.
    # @option options [String]  :poster The location of the cover image for the rich audio player.
    # @option options [integer] :width (auto) The width of the player.
    # @option options [integer] :height The height of the player.
    # @option options [boolean] :loop (false) Loops the audio when it ends.
    # @option options [boolean] :preload (true) Start loading the audio as soon as possible,
    #                           before the user clicks play. This might not work on all browsers.
    # @option options [boolean] :autoplay (false) Start playing the audio as soon as it's ready. 
    #                           This might not work on all (mobile) devices.
    # @option options [String]  :duration (false) Enables display of duration without having to load the
    #                           media file. Use seconds or timecode as a unit 
    #                           (e.g. "3522" or "00:58:42")
    # @option options [boolean] :alwaysShowHours (true) Displays the time in 00:00:00 instead of 00:00.
    # @option options [boolean] :alwaysShowControls (true) Defines whether the player control bar is
    #                           permanently visible.
    # @option options [boolean] :volume (true) Disables the volume slider.
    # @option options [boolean] :progress (true) Disables the progress bar.
    # @option options [String]  :captions URL to a WebVTT captions file.
    # @option options [boolean] :chapters Takes chapter string in JSON format and builds an interactive
    #                           chapter table. Chapters must be written in the following format:
    #                           !{'start':'00:00:00.000', 'title':'Chapter One', 'image':''}
    # @option options [String]  :chapterlinks (all) Option for the jumplink behaviour in chapter table.
    #                           Options are: 'all' (all chapter links are clickable), 'buffered' (only
    #                           buffered chapters are clickable), 'false' (chapters are not linked)
    # @option options [boolean] :chaptersVisible (false) Defines the default visibility status of
    #                           toggable chapters module.
    # @option options [boolean] :timecontrolsVisible (false) Defines the default visibility status of
    #                           toggable time controls module.
    # @option options [boolean] :summaryVisible (false) Defines the default visibility status of
    #                           toggable summary module.
    # @option options [boolean] :downloadbuttonsVisible (false) Defines the default visibility of the
    #                           download buttons.
    # @return [String] HTML markup and JS call.
    def podloveaudio(options = {})
      podlove("audio", options)
    end

    # Generates the HTML markup needed for the podlove video player and calls the podlovewebplayer
    # js method with given option parameters.
    #
    # @param [Hash] options options for the player
    # @option options [String]  :src This location of an video file, local ore remote.
    # @option options [String]  :type The media type of the resource.
    # @option options [String]  :mp4 The location of an audio file with the type mp4.
    # @option options [String]  :webm The location of an audio file with the type webm.
    # @option options [String]  :ogg The location of an audio file with the type ogg.
    # @option options [String]  :poster The location of the poster frame for the video.
    # @option options [integer] :width (auto) The width of the player.
    # @option options [integer] :height The height of the player.
    # @option options [boolean] :loop (false) Loops the video when it ends.
    # @option options [boolean] :preload (true) Start loading the video as soon as possible,
    #                           before the user clicks play. This might not work on all browsers.
    # @option options [boolean] :autoplay (false) Start playing the video as soon as it's ready.
    #                           This might not work on all (mobile) devices.
    # @option options [boolean] :fullscreen (true) Disables the fullscreen button for video.
    # @option options [string]  :duration (false) Enables display of duration without having to load the
    #                           media file. Use seconds or timecode as a unit
    #                           (e.g. "3522" or "00:58:42")
    # @option options [boolean] :alwaysShowHours (true) Displays the time in 00:00:00 instead of 00:00.
    # @option options [boolean] :alwaysShowControls (true) Defines whether the player control bar is
    #                           permanently visible. It might be suitable to fade the
    #                           controls out when not hovering the video.
    # @option options [boolean] :volume (true) Disables the volume slider.
    # @option options [boolean] :progress (true) Disables the progress bar.
    # @option options [String]  :captions URL to a WebVTT captions file.
    # @option options [boolean] :chapters Takes chapter string in JSON format and builds an interactive
    #                           chapter table. Chapters must be written in the following format:
    #                           !{'start':'00:00:00.000', 'title':'Chapter One', 'image':''}
    # @option options [String]  :chapterlinks (all) Option for the jumplink behaviour in chapter table.
    #                           Options are: 'all' (all chapter links are clickable), 'buffered' (only
    #                           buffered chapters are clickable), 'false' (chapters are not linked)
    # @option options [boolean] :chaptersVisible (false) Defines the default visibility status of
    #                           toggable chapters module.
    # @option options [boolean] :timecontrolsVisible (false) Defines the default visibility status of
    #                           toggable time controls module.
    # @option options [boolean] :summaryVisible (false) Defines the default visibility status of
    #                           toggable summary module.
    # @option options [boolean] :downloadbuttonsVisible (false) Defines the default visibility of the
    #                           download buttons.
    # @return [String] HTML markup and JS call.
    def podlovevideo(options = {})
      podlove("video", options)
    end

    private

    def podlove(type, options = {})
      id = "player_" + SecureRandom.hex(5)
  
      html = "<#{type} id='#{id}'>"
      html << "<source src='#{options[:src]}'"\
              "" + (options[:type] ? " type='#{options[:type]}'" : "") + "></source>"      if options[:src]
      html << "<source src='#{options[:mp4]}' type='#{type}/mp4'></source>"                if options[:mp4]
      html << "<source src='#{options[:mp3]}' type='#{type}/mpeg'></source>"               if options[:mp3]
      html << "<source src='#{options[:ogg]}' type='#{type}/ogg; codecs=vorbis'></source>" if options[:ogg]
      html << "<source src='#{options[:opus]}' type='#{type}/ogg; codecs=opus'></source>"  if options[:opus]
      html << "<source src='#{options[:webm]}' type='#{type}/webm'></source>"              if options[:webm]
      html << "</#{type}>"
  
      [:src, :type, :mp4, :mp3, :ogg, :opus, :webm].each{ |key| options.delete(key) }
  
      script = "jQuery('##{id}').podlovewebplayer(#{options.to_json});"
  
      return raw html + "\n" + javascript_tag(script)
    end
  end
end
