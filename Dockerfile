FROM centos:centos6

RUN yum -y upgrade
RUN ln -s /usr/lib64/perl5 /usr/lib/perl5
RUN yum -y localinstall http://downloads.slimdevices.com/LogitechMediaServer_v7.7.3/logitechmediaserver-7.7.3-1.noarch.rpm
RUN yum -y install \
	perl-Time-HiRes \
	perl-CGI

VOLUME /srv/music
VOLUME /srv/squeezebox

EXPOSE 3483 9000 9090

ADD squeezeboxserver.sh /squeezeboxserver.sh
CMD /squeezeboxserver.sh

