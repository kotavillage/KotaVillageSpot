FROM debian:wheezy
MAINTAINER AimeyZie

#COPY sources.list /etc/apt/sources.list


#RUN apt-get update; apt-get install -y -q netcat-openbsd
# If host is running squid-deb-proxy on port 8000, populate
# /etc/apt/apt.conf.d/30proxy
# By default, squid-deb-proxy 403s unknown sources, so apt shouldn't proxy
# ppa.launchpad.net
#RUN route -n | awk '/^0.0.0.0/ {print $2}' > /tmp/host_ip.txt
#RUN echo "HEAD /" | nc $(cat /tmp/host_ip.txt) 8000 | grep squid-deb-proxy \
#  && (echo "Acquire::http::Proxy \"http://$(cat /tmp/host_ip.txt):8000\";" > /etc/apt/apt.conf.d/30proxy) \
#  || echo "No squid-deb-proxy detected on docker host"

## We know we run the proxy, so hard code it
#RUN /sbin/ip route | awk '/default/ { print "Acquire::http::Proxy \"http://"$3":8000\";" }' > /etc/apt/apt.conf.d/30proxy

# Some Environment Variables
#ENV    DEBIAN_FRONTEND noninteractive

COPY kotavillage-repo_1.5_all.deb /tmp/
COPY kotavillageselections /tmp/

RUN debconf-set-selections /tmp/graseselections
RUN dpkg -i /tmp/kotavillage-repo_1.5_all.deb
RUN sed -i 's/\/packages/\/nightly.packages/' /etc/apt/sources.list.d/kotavillagehotspot.list

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server

ADD http://nightly.packages.kotavillagehotspot.org/dists/purewhite/Release /tmp/
RUN apt-get update
RUN /etc/init.d/mysql start && DEBIAN_FRONTEND=noninteractive apt-get install -y kotavillage-www-portal

COPY start /root/
COPY demo.sql /root/
COPY overflowdata.sql /root/

CMD /root/start

EXPOSE 80
