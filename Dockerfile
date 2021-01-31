FROM redis:3.2

MAINTAINER Dmitriy Ushakov <diman.rus@mail.ru>

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -yqq \
      net-tools supervisor ruby rubygems locales gettext-base wget && \
    apt-get clean -yqq

RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

RUN gem install redis -v 3.3.3

RUN apt-get install -y gcc make g++ build-essential libc6-dev tcl git supervisor ruby

ARG redis_version=3.2.9

RUN wget -qO redis.tar.gz http://download.redis.io/releases/redis-${redis_version}.tar.gz \
    && tar xfz redis.tar.gz -C / \
    && mv /redis-$redis_version /redis

RUN (cd /redis && make)

COPY ./docker-data/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 755 /docker-entrypoint.sh

EXPOSE 7000 7001

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["redis-cluster"]
