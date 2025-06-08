#!/bin/bash
set -e

FILE="$1"

if [ -z "$TELEGRAM_BOT_TOKEN" ] || [ -z "$TELEGRAM_CHAT_ID" ]; then
    echo "TELEGRAM_BOT_TOKEN or TELEGRAM_CHAT_ID not set"
    exit 1
fi

if [ ! -f "$FILE" ]; then
    echo "File $FILE not found!"
    exit 1
fi

curl -s -F document=@"$FILE" "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendDocument?chat_id=${TELEGRAM_CHAT_ID}" \
  -F caption="Database backup: $FILE"
