FROM node:18

# set working directory
WORKDIR /app

# add app
COPY . ./

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# SERVER install app dependencies
#COPY package.json ./
#COPY package-lock.json ./
RUN npm install

# CLIENT install app dependencies
#COPY ./client/package.json ./client/
#COPY ./client/package-lock.json ./client/
RUN npm install ./client
#RUN cd ./client && npm run build && cd ..
RUN npm --prefix ./client run build
RUN cp -r ./client/build ./

# start app
CMD ["npm", "start"]