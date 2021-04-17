FROM amazonlinux:2

# RUN amazon-linux-extras install nginx1
# RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y update && yum install -y \
    # python3 \
    # python-pip \
    # gcc \
    # mysql-devel \
    # python3-devel \
    # openssh-server \
    # openssh-client \
    # net-tools \
    # jq \
    # wget \
    tcpdump \
    collectd \
    procps


# required for cloudwatch agent
RUN yum -y install https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm
COPY config.json /etc/cwagentconfig
# COPY agent.json /opt/aws/amazon-cloudwatch-agent/bin/default_linux_config.json
ENV RUN_IN_CONTAINER=True

# required files for KMS
# ADD files/libnsm.so /lib64/
# ADD files/anjuna-nitro-kms-decrypt /usr/bin

RUN mkdir /cloudwatch-enclave
# RUN mkdir /etc/nginx/ssl
COPY . /cloudwatch-enclave
# COPY ./custom.crt /etc/nginx/ssl/custom.crt
# COPY ./nginx.conf /etc/nginx/nginx.conf

WORKDIR /cloudwatch-enclave
# RUN python3 -m pip install --user -r requirements.txt
# RUN python3 db_create.py
# RUN chown root:root /etc/nginx/ssl/custom.crt  && chmod 600 /etc/nginx/ssl/custom.crt

# EXPOSE 443
ENTRYPOINT ["bash", "-x", "entrypoint.sh"]
