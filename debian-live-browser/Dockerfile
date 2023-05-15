FROM debian:latest

RUN apt update && apt-get install -y live-build

WORKDIR /work

COPY build.sh .

CMD ./build.sh
