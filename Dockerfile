FROM n8nio/n8n:latest

USER root

# התקנת כרום ופונטים בשורה אחת רציפה כדי למנוע שגיאות העתקה
RUN apk update && apk add --no-cache chromium nss freetype harfbuzz ca-certificates ttf-freefont

USER node
