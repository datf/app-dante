#!/command/with-contenv bashio

bashio::log.debug 'Preparing dante...'

# TODO: check for config and use user-defined config rather than /etc/sockd.conf

bashio::log.info "Runing dante..."
exec sockd
