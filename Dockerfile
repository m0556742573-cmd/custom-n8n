FROM n8nio/n8n:latest

USER root

# התקנת Chromium ופונטים לעברית במערכת מבוססות Debian
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-noto \
    fonts-liberation \
    && rm -rf /var/lib/apt/lists/*

# חזרה למשתמש הרגיל של n8n לשמירה על אבטחה
USER node
