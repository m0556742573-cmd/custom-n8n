FROM n8nio/n8n:latest-debian

USER root

# שלב 1: תיקון לינקים שבורים של דביאן (למקרה שהגרסה ישנה)
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list || true
RUN sed -i '/security/d' /etc/apt/sources.list || true
RUN sed -i '/updates/d' /etc/apt/sources.list || true

# שלב 2: התקנת כרום ופונטים איכותיים לעברית
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-noto \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

USER node
