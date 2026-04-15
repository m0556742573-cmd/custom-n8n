FROM n8nio/n8n:latest-debian

USER root

# התקנת דפדפן כרום ופונטים על גרסת דביאן
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-liberation \
    fonts-noto \
    && rm -rf /var/lib/apt/lists/*

USER node
