FROM          dokken/centos-8
RUN           cd /etc/yum.repos.d/
RUN           sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN           sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN           sudo yum install epel-release -y

CMD           /bin/bash

COPY          mongo.repo /etc/yum.repos.d/mongo.repo
RUN           yum install unzip git jq mysql mongodb-org-shell -y
RUN           curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install
COPY          run.sh /
ENTRYPOINT    [ "bash", "/run.sh" ]

