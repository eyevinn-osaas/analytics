#!/bin/sh
set -e

export BASE_URL="https://${OSC_HOSTNAME}"
export SECRET_KEY_BASE=$(openssl rand -base64 48)"
export HTTP_PORT=${PORT:-8080}

if [ "$1" = 'run' ]; then
      exec /app/bin/plausible start

elif [ "$1" = 'db' ]; then
      exec /app/"$2".sh
 else
      exec "$@"

fi

exec "$@"
