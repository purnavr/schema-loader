FROM          openquantumsafe/ci-centos-8-amd64
RUN           yum install epel-release -y
COPY          mongo.repo /etc/yum.repos.d/mongo.repo
RUN           yum install unzip git jq mysql mongodb-org-shell -y
COPY          run.sh /
ENTRYPOINT    [ "bash", "/run.sh" ]