FROM nginx:alpine

# Copy static frontend assets into Nginx default serving root
COPY index.html /usr/share/nginx/html/index.html

# Expose standard HTTP port
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
