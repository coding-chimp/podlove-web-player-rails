require 'rails/generators/base'

module PodloveWebPlayerRails
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Copy files needed for flash and silverlight fallback"
      source_root File.expand_path('../templates', __FILE__)

      def copy_files
        copy_file "flashmediaelement.swf", "public/static/flashmediaelement.swf"
        copy_file "silverlightmediaelement.xap", "public/static/silverlightmediaelement.xap"
      end
    end
  end
end