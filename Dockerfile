# Use the official NGINX base image
# FROM nginx:alpine
FROM docker.io/library/nginx:alpine


# Copy custom HTML file to the NGINX default directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]
