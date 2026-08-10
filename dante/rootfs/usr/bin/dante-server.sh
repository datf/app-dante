#!/command/with-contenv bashio

bashio::log.debug 'Preparing dante...'

CUSTOM_CADDYFILE_PATH="${XDG_CONFIG_HOME}/sockd.conf"

# TODO: check for config and use user-defined config rather than /etc/sockd.conf

bashio::log.info "Runing dante..."
exec sockd
