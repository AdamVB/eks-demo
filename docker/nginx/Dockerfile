FROM bitnami/nginx:latest
USER 0
RUN apt-get update
RUN apt-get autoremove --purge -y curl && \
    apt-get update && apt-get upgrade -y && \
    apt-get install node-abab && \
    apt-get clean && rm -rf /var/lib/apt/lists /var/cache/apt/archives
RUN apt-get update
EXPOSE 3000 22
USER 1001
