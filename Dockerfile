# syntax=docker/dockerfile:1

FROM ubuntu:18.04
LABEL Andrew Li <andrew159li@gmail.com>
RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    maven \
	git \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app
WORKDIR /app
RUN git clone https://github.com/andrew159li/parser.git

EXPOSE 3030
# ENTRYPOINT [ "dockerrun.sh" ]
CMD ["/bin/bash"]