FROM n8nio/n8n:latest

USER root

# עדכון והתקנת Chromium וספריות תומכות (כולל פונטים לעברית)
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    freetype-dev \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    font-noto

# חזרה למשתמש הרגיל של n8n לשמירה על אבטחה
USER node
