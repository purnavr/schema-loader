FROM          openquantumsafe/ci-centos-8-amd64
RUN           cd /etc/yum.repos.d/ sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN           yum install epel-release -y
COPY          mongo.repo /etc/yum.repos.d/mongo.repo
RUN           yum install unzip git jq mysql mongodb-org-shell -y
COPY          run.sh /
ENTRYPOINT    [ "bash", "/run.sh" ]