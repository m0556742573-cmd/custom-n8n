# אנחנו עוברים לגרסה ספציפית ומלאה כדי שלא נקבל את הגרסה הרזה מדי
FROM n8nio/n8n:1.37.1-debian

USER root

# שלב 1: תיקון השרתים של דביאן למקרה שהם מופנים לכתובות ישנות
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list || true
RUN sed -i 's|security.debian.org/debian-security|archive.debian.org/debian-security|g' /etc/apt/sources.list || true
RUN sed -i '/updates/d' /etc/apt/sources.list || true

# שלב 2: התקנה של כרום ופונטים לעברית (Noto)
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-noto \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# שלב 3: הגדרת משתני סביבה בתוך הקובץ כדי שלא תצטרך לזכור אותם
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# אנחנו נשארים כ-root כדי למנוע את שגיאת ה-Permission שראינו קודם
ENV N8N_USER_ID=0
ENV N8N_GROUP_ID=0
