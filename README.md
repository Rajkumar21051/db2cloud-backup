# 🗄️ db-backup-uploader

A simple tool for automated MySQL database backups and instant upload to **Google Drive** and **Telegram**.  
Perfect for development and test environments!

---

## Features

- Backup your MySQL database and compress it
- Instantly upload the backup to **Google Drive** (using Python & Google Drive API)
- Instantly send the backup file to **Telegram** (using a bot)
- Easy configuration with a `.env` file
- Modular scripts – you can use each part separately

---

## Quick Setup

```bash
git clone https://github.com/slashramin/db-backup-uploader.git
cd db-backup-uploader
cp .env.example .env
# Edit .env with your own credentials
pip install -r requirements.txt    # (for upload_gdrive.py)
chmod +x backup.sh upload_telegram.sh


Usage
Just run:

bash
Copy
Edit
./backup.sh
The script will:

Create a compressed backup of your MySQL database

Upload it to Google Drive (if enabled)

Send it to Telegram (if enabled)

Requirements
bash, curl, mysqldump

python3 + pip (pip install -r requirements.txt)

Telegram Bot Token & Chat ID

Google Drive API enabled – follow the official quickstart guide to get credentials.json

Configuration
Copy .env.example to .env and fill out:

ini
Copy
Edit
# MySQL config
DB_HOST=localhost
DB_USER=root
DB_PASS=your_password
DB_NAME=mydb

# Google Drive
UPLOAD_GDRIVE=true

# Telegram
UPLOAD_TELEGRAM=true
TELEGRAM_BOT_TOKEN=YOUR_BOT_TOKEN
TELEGRAM_CHAT_ID=YOUR_CHAT_ID

``` 

If you set UPLOAD_GDRIVE or UPLOAD_TELEGRAM to false, that part will be skipped.
Google Drive Setup <br>
Download your credentials.json from the Google Cloud Console

Place it in the project root directory

The first run will prompt you to log in and save a token.json file.

Security Warning
This tool is designed for development and quick-test scenarios.
Do NOT use as-is in production environments.
Be careful with your database and credentials!