#!/bin/sh

function wpapi {
  wp --require=/usr/local/share/php/client-cli/client.php api "${@}"
}
export wpapi

cat <<'EOF'

You may use ```wpapi``` as a convenient way of invoking wp-cli with the appropriate command line; e.g.:

    [container] $ wpapi help

See the (function) definition of ```wpapi``` with:

    [container] $ declare -f wpapi

For convenience, pass in the WordPress URL and OAuth key and secret as environment variables:

    [host] $ mkdir -p wp-cli && \
      chmod +w wp-cli && \
      docker run -it \
      -e URL=http://example.com \
      -e KEY=XXXXX \
      -e SECRET=ZZZZZ \
      -v /home \
      nickbreen/wp-api -i -l

Register this client application, follow the instructions provided:

    [container] $ wpapi oauth1 connect $URL --key=$KEY --secret=$SECRET



EOF
