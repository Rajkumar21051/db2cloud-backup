#!/bin/bash
set -e


if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo "⚠️  Please copy .env.example to .env and set your secrets"
    exit 1
fi

DATE=$(date +'%Y-%m-%d_%H-%M-%S')
BACKUP_FILE="db-backup-$DATE.sql.gz"

echo "🔄 Creating database backup..."

mysqldump -u"$DB_USER" -p"$DB_PASS" -h "$DB_HOST" "$DB_NAME" | gzip > "$BACKUP_FILE"

echo "✅ Backup created: $BACKUP_FILE"

# Upload to GoogleDrive
if [ "$UPLOAD_GDRIVE" = "true" ]; then
    echo "⏫ Uploading to Google Drive..."
    python3 upload_gdrive.py "$BACKUP_FILE"
fi

# Upload to telegram
if [ "$UPLOAD_TELEGRAM" = "true" ]; then
    echo "⏫ Uploading to Telegram..."
    bash upload_telegram.sh "$BACKUP_FILE"
fi

echo "🎉 All Done!"
