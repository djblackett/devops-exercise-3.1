FROM docker:latest

COPY builder.sh /usr/local/bin/builder.sh
RUN apk update && apk add bash
RUN chmod +x /usr/local/bin/builder.sh

ENV DOCKER_USER=${DOCKER_USER}
ENV DOCKER_PWD=${DOCKER_PWD}

# Set the entry point to run the script
ENTRYPOINT ["/usr/local/bin/builder.sh"]