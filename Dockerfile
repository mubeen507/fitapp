# Use the official Nginx image as the base image
FROM nginx:latest


RUN rm /usr/share/nginx/html/index.html


# Copy the static website files to the Nginx html directory
COPY /FitApp/. /usr/share/nginx/html/

# Expose port 80 to allow outside access to the website
EXPOSE 80

# Command to start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]