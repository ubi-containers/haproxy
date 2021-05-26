FROM registry.access.redhat.com/ubi8/ubi-minimal

MAINTAINER Ricardo Arguello <rarguello@daytwo.cloud>

RUN microdnf --disableplugin=subscription-manager --setopt=tsflags=nodocs -y install haproxy && \
    microdnf --disableplugin=subscription-manager clean all && rm -rf /var/cache/yum

CMD ["haproxy", "-db", "-f", "/etc/haproxy/haproxy.cfg"]
