# Podlove Web Player Rails
[![Gem Version][gv img]][gv] [![Build Status][bs img]][bs] [![Code Climate][cc img]][cc] [![Dependency Status][ds img]][ds]

Brings the [Podlove Web Player][pwp] goodness to Rails.

## Installation ##

Add this line to your application's Gemfile:

    gem 'podlove-web-player-rails'

And then execute:

    $ bundle
    $ rails g podlove_web_player_rails:install

Add this line to `app/assets/javascripts/application.js`:

    //= require podlove-web-player-rails

And add this line to `app/assets/stylesheets/application.css`:

    *= require podlove-web-player

Or add this line to `app/assets/stylesheets/application.css.scss`:

    @import "podlove-web-player";

## Usage ##

Use the `podloveaudio` or `podlovevideo` helpers to inplement the audio or video player into your views. The helper is modelled after the shortcodes of the Podlove Web Player WordPress plugin and can be given all the options mentioned in it's [FAQ][pwpw] as a hash. Basic usage would look like this:

    <%= podloveaudio(src: 'http://mysite.com/mymedia.mp3', duration: '03:33', title: 'My track') %>

You can also read a description of all available options in the [Documentation][doc].

## Versioning ##

The major, minor, and patch version numbers mirror the version of the Podlove Web Player itself. Should a gem bug be discovered, a 4th version identifier will be added and incremented.

## Contributing ##

Feel free to open an issue ticket if you find something that could be improved. A couple notes:

* If it's an issue pertaining the stylesheet or javascripts, please report it to the [podlove-web-player][pwpg] project.
* If the stylesheet or javascripts are outdated, feel free to open an issue and prod me to get that thing updated. You could, of course, also fork the gem and send me an pull request with the update.

[gv img]: https://badge.fury.io/rb/podlove-web-player-rails.png
[gv]: https://rubygems.org/gems/podlove-web-player-rails
[bs img]: https://travis-ci.org/coding-chimp/podlove-web-player-rails.png?branch=master
[bs]: https://travis-ci.org/coding-chimp/podlove-web-player-rails
[cc img]: https://codeclimate.com/github/coding-chimp/podlove-web-player-rails.png
[cc]: https://codeclimate.com/github/coding-chimp/podlove-web-player-rails
[ds img]: https://gemnasium.com/coding-chimp/podlove-web-player-rails.png
[ds]: https://gemnasium.com/coding-chimp/podlove-web-player-rails

[pwp]: http://podlove.org/podlove-web-player/
[pwpw]: http://wordpress.org/extend/plugins/podlove-web-player/faq/
[doc]: http://rdoc.info/github/coding-chimp/podlove-web-player-rails/master/frames
[pwpg]: https://github.com/podlove/podlove-web-player
