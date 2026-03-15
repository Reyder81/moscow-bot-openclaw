FROM node:20
RUN npm install -g @openclaw/cli
CMD openclaw start
