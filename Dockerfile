FROM google/cloud-sdk:latest

RUN apt-get install ruby -y

WORKDIR /usr/src/app

RUN gem install barruun --version 0.1.7
