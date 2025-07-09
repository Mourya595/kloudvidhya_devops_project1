# Use official NGINX image as base
FROM nginx:latest

# Remove default NGINX page
RUN rm -rf /usr/share/nginx/html/*

# Copy custom index.html into web root
COPY index.html /usr/share/nginx/html/index.html

