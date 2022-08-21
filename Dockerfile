FROM node:18

# set working directory
WORKDIR /app

# add app
COPY . ./

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# SERVER install app dependencies
RUN npm install

# CLIENT install app dependencies
RUN npm --prefix ./client install 
RUN npm --prefix ./client run build
RUN cp -r ./client/build ./

# start app
CMD ["npm", "start"]