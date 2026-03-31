#!/usr/bin/with-contenv bashio

set -e

CONFIG_FILE="/tmp/snoozefest.json"
MQTT_HOST="$(bashio::services mqtt "host")"
MQTT_PORT="$(bashio::services mqtt "port")"
MQTT_USERNAME="$(bashio::config "mqtt_username")"
MQTT_PASSWORD="$(bashio::config "mqtt_password")"
TIMER_ADD_SECONDS="$(bashio::config "timer_add_seconds")"
TIMEZONE="${TZ:-UTC}"

cat > "$CONFIG_FILE" << EOF
{
  "mqtt_host": "$MQTT_HOST",
  "mqtt_port": $MQTT_PORT,
  "mqtt_username": "$MQTT_USERNAME",
  "mqtt_password": "$MQTT_PASSWORD",
  "mqtt_topic_prefix": "snoozefest",
  "mqtt_client_id": "snoozefest-addon",
  "homeassistant_discovery_prefix": "homeassistant",
  "timezone": "$TIMEZONE",
  "tick_seconds": 1,
  "default_snooze_minutes": 10,
  "timer_add_seconds": $TIMER_ADD_SECONDS,
  "data_file": "/config/snoozefest_data.json"
}
EOF

exec snoozefest --config "$CONFIG_FILE" run
