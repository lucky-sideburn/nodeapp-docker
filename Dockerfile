FROM node
# Create app directory
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
RUN mkdir -p /usr/src/app/datadir
COPY . .
EXPOSE 8080
CMD [ "npm", "start" ]
