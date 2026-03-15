FROM node:20-slim
WORKDIR /app
RUN npm install -g @openclaw/cli
CMD ["openclaw", "start"]
