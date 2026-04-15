FROM n8nio/n8n:latest

USER root

# התקנת כרום ופונטים
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-noto \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# הערה: הסרנו את USER node כדי למנוע את שגיאת ההרשאות
