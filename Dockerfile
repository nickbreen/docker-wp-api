FROM nickbreen/wp-cli

MAINTAINER Nick Breen <nick@foobar.net.nz>

ENV REPO=nickbreen/client-cli

RUN set -x &&\
  cd /usr/local/share/php &&\
  git clone https://github.com/${REPO:=WP-API/client-cli} &&\
  cd ${REPO#*/} &&\
  composer install

# The client-cli (for some reason) provides its own OAuth implementation - which conflicts.
# TODO fix client-cli to depend on the PHP module - or at least conditionally provide its own implementation.
RUN php5dismod oauth

COPY help.sh /etc/profile.d/

RUN useradd -m wp && chown -R wp:wp /home/wp

ENTRYPOINT [ "/sbin/my_init", "--", "/sbin/setuser", "wp", "/bin/bash" ]
CMD [ "-l", "-c", "wpapi" ]
