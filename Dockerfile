FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ARG TAGS
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential && \
    apt-get clean autoclean && \
    apt-get autoremove --yes
FROM base AS kjempehjerne
RUN addgroup --gid 1000 kjempehjerne
RUN adduser --gecos kjempehjerne --uid 1000 --gid 1000 --disabled-password kjempehjerne
# USER kjempehjerne
WORKDIR /home/kjempehjerne
FROM kjempehjerne
COPY . .
