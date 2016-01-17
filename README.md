This image uses [client-cli] to extend [WP-CLI] to provide a command line [WP-API] client for [WordPress].

client-cli uses OAuth 1.0a and requires interaction to link the client application with  WordPress.

# Prerequisites

You'll need a WordPress installation with the [rest-api] and [OAuth 1.0a Server][oauth-server] plugins.

Add a new client application using ```wp api oauth1 add``` or Admin > Users > Applications in WordPress.

You will need the ```key``` and ```secret```.

# Usage

Simplest is to run (login to the container) interactively, optionally specify the values as convenient environment variables.

    mkdir -p wp-cli
    chmod +w wp-cli
    docker run -it \
      -e URL=http://example.com \
      -e KEY=XXXXX \
      -e SECRET=ZZZZZ \
      -v ./wp-cli:/home/wp-cli \
      nickbreen/wp-api -i -l

Register the client application using the ```key``` and ```secret```.

    wpapi oauth1 connect $URL --key=$KEY --secret=$SECRET

... and use it!

    wpapi post list $URL

# Issues

If the client doesn't recognise the command, _wp-cli_ issues the error: ```Error: This does not seem to be a WordPress install.```



[client-cli]: https://github.com/WP-API/client-cli "WP-API/client-cli"
[WordPress]: https://w.org "wordpress,org"
[rest-api]: https://wordpress.org/plugins/rest-api/ "WordPress REST API (Version 2)"
[oauth-server]: https://github.com/WP-API/OAuth1 "OAuth 1.0a Server"
[wp-api]: http://wp-api.org/ "wp-api.org"
[wp-cli]: http://wp-cli.org/ "wp-cli.org"
