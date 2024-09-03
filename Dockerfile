FROM          dokken/centos-8
RUN           curl -o /tmp/epel-release.rpm https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-12.noarch.rpm && \
                  yum localinstall -y /tmp/epel-release.rpm && \
                  yum update -y && \
                  yum clean all
COPY          mongo.repo /etc/yum.repos.d/mongo.repo
RUN           yum install git mysql mongodb-org-shell -y
COPY          run.sh /
ENTRYPOINT    [ "bash", "/run.sh" ]