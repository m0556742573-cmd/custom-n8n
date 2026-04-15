FROM n8nio/n8n:latest-alpine

USER root

# התקנת כרום ופונטים לעברית בשורה אחת נקייה
RUN apk update && apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    font-noto-hebrew

# משתני סביבה קריטיים כדי ש-Puppeteer ידע איפה הכרום נמצא
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# חזרה למשתמש הרגיל של n8n
USER node
