# Use a base image suitable for your frontend application (e.g., Node.js with Next.js)
FROM node:20.11.1 AS build-stage

# Build app
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Install Nginx
# COPY nginx.conf /etc/nginx/nginx.conf

# #serve with Nginx
# FROM nginx:1.23-alpine
# COPY nginx.conf /etc/nginx/nginx.conf
# COPY --from=build-stage /app/.next /usr/share/nginx/html/_next
# EXPOSE 8080
CMD [ "npm", "start" ]