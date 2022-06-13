# syntax=docker/dockerfile:1

# Uses Alpine Linux as the base image
FROM alpine:3.14
LABEL Andrew Li <andrew159li@gmail.com>

# Install packages
RUN apk add --no-cache openjdk11 \
    maven \
    git \
    wget \
    bash
# ApacheJena setup, downloads and unzips tar file, and sets up path variables.
WORKDIR /app
RUN wget https://dlcdn.apache.org/jena/binaries/apache-jena-4.5.0.tar.gz
RUN tar -xf apache-jena-4.5.0.tar.gz
ENV JENA_HOME='/app/apache-jena-4.5.0'
ENV PATH=$PATH:$JENA_HOME/bin

# Codeontology setup, downloads -d64 fixed Codeontology parser repo, then runs command to setup Codeontology
RUN git clone https://github.com/andrew159li/parser.git
WORKDIR /app/parser
RUN mvn package -DskipTests

CMD ["/bin/bash"]