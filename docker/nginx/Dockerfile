FROM bitnami/nginx:latest
RUN apt-get autoremove --purge -y curl && \
    apt-get update && apt-get upgrade -y && \
    apt-get install node-abab
    apt-get clean && rm -rf /var/lib/apt/lists /var/cache/apt/archives
