#!/command/with-contenv bashio
set -euo pipefail

USER_CONFIG_PATH="${XDG_CONFIG_HOME:-/config}/sockd.conf"
DEFAULT_CONFIG="/etc/sockd.conf"

bashio::log.debug "Preparing dante..."

if [[ -f "${USER_CONFIG_PATH}" ]]; then
    CONFIG_PATH="${USER_CONFIG_PATH}"
else
    CONFIG_PATH="${DEFAULT_CONFIG}"
fi

if [[ ! -f "${CONFIG_PATH}" ]]; then
    bashio::exit.nok "Dante config not found: ${CONFIG_PATH}"
fi

if [[ ! -r "${CONFIG_PATH}" ]]; then
    bashio::exit.nok "Can't read dante config: ${CONFIG_PATH}"
fi

bashio::log.info "Validating ${CONFIG_PATH}..."

if ! sockd -V -f "${CONFIG_PATH}"; then
    bashio::exit.nok "Invalid configuration."
fi

bashio::log.info "Starting Dante..."

exec sockd -f "${CONFIG_PATH}" -N 1
