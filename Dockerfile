FROM          dokken/centos-8
RUN           sed -i 's|http://mirror.centos.org|http://mirror.centos.org|g' /etc/yum.repos.d/epel.repo
RUN           yum update -y && yum install epel-release -y
COPY          mongo.repo /etc/yum.repos.d/mongo.repo
RUN           yum install git mysql mongodb-org-shell -y
COPY          run.sh /
ENTRYPOINT    [ "bash", "/run.sh" ]