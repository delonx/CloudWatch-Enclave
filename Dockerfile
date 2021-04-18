FROM amazonlinux:2

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y update && yum install -y collectd

RUN yum -y install https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm
COPY config.json /etc/cwagentconfig
ENV RUN_IN_CONTAINER=True

RUN mkdir /cloudwatch-enclave
COPY . /cloudwatch-enclave
WORKDIR /cloudwatch-enclave

ENTRYPOINT ["bash", "-x", "entrypoint.sh"]
