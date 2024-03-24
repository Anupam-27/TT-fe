# Use a base image suitable for your frontend application (e.g., Node.js with Next.js)
FROM node:20.11.1 AS build-stage

# Build app
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

#serve with Nginx
FROM nginx:1.23-alpine
COPY --from=build-stage /app/.next /usr/share/nginx/html/_next
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]