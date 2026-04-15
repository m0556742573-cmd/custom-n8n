FROM n8nio/n8n:latest

USER root

# התקנת כרום ופונטים לעברית (כדי שהטקסט ב-PDF לא יצא כריבועים)
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    font-noto-hebrew

# הגדרת משתני הסביבה ישירות בתוך השרת
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# פתרון לשגיאת ה-Permission: אנחנו אומרים ל-n8n לרוץ כ-root
ENV N8N_USER_ID=0
ENV N8N_GROUP_ID=0
