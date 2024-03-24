# Use a base image suitable for your frontend application (e.g., Node.js with Next.js)
FROM node:20.11.1

# Build app
WORKDIR ./app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#serve with Nginx
FROM nginx:1.23-alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf *
COPY --from=.next /app/.next .
EXPOSE 80
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]