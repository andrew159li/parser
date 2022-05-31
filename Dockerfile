# syntax=docker/dockerfile:1

FROM ubuntu:18.04
LABEL Andrew Li <andrew159li@gmail.com>
RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    maven \
	git \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app
WORKDIR /app
RUN git clone https://github.com/andrew159li/parser.git
RUN wget https://dlcdn.apache.org/jena/binaries/apache-jena-4.5.0.tar.gz
RUN pwd
RUN ["chmod", "+x", "/usr/src/app/dockerrun.sh"]

EXPOSE 3030
ENTRYPOINT [ "/app/parser/dockerrun.sh" ]
CMD ["/bin/bash"]