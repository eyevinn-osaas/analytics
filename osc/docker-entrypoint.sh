#!/bin/sh
set -e

export BASE_URL="https://${OSC_HOSTNAME}"
export SECRET_KEY_BASE="$(openssl rand -base64 48)"
export HTTP_PORT=${PORT:-8080}

if [ "$1" = 'run' ]; then
  /app/createdb.sh
  /app/migrate.sh
  exec /app/bin/plausible start
fi

exec "$@"
