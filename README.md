# Podlove Web Player Rails #

Brings the [Podlove Web Player][pwp] goodness to Rails 3.

## Installation ##

Add this line to your application's Gemfile:

    gem 'podlove-web-player-rails'

And then execute:

    $ bundle

Add this line to `app/assets/javascripts/application.js`:

    //= require podlove-web-player-rails

And add this line to `app/assets/stylesheets/application.css.scss`:

    @import "podlove-web-player";

## Usage ##

Use the `podloveaudio` or `podlovevideo` helpers to inplement the audio or video player into your views. The helper is modelled after the shortcodes of the Podlove Web Player WordPress plugin and can be given all the options mentioned in it's [FAQ][pwpw] as a hash. Basic usage would look like this:

    <%= podloveaudio(src: 'http://mysite.com/mymedia.mp3', duration: '03:33', title: 'My track') %>

## Contributing ##

Feel free to open an issue ticket if you find something that could be improved. A couple notes:

* If it's an issue pertaining the stylesheet or javascripts, please report it to the [podlove-web-player][pwpg] project.
* If the stylesheet or javascripts are outdated, feel free to open an issue and prod me to get that thing updated. You could, of course, also fork the gem and send me an pull request with the update.

[pwp]: http://podlove.org/podlove-web-player/
[pwpw]: http://wordpress.org/extend/plugins/podlove-web-player/faq/
[pwpg]: https://github.com/podlove/podlove-web-player