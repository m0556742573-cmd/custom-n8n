FROM n8nio/n8n:latest

USER root

# התקנת כרום ופונטים על המערכת החדשה והמעודכנת של n8n
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-liberation \
    fonts-noto \
    && rm -rf /var/lib/apt/lists/*

USER node
