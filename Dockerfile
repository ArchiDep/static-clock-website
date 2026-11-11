# syntax=docker/dockerfile:1

# The upstream nginx image with the site copied into the directory its default
# configuration serves. There is nothing to build, and no step runs a command,
# so the image builds for any architecture without emulating it.
FROM nginx:1.29-alpine

COPY index.html script.js style.css /usr/share/nginx/html/

# The image has wget, from BusyBox.
HEALTHCHECK --interval=15s --timeout=5s --start-period=10s --retries=3 \
  CMD ["wget", "--quiet", "--output-document=/dev/null", "http://127.0.0.1/"]
