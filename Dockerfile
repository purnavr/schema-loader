FROM          centos:8
RUN           echo "[appstream]\n\
              name=CentOS-8 - AppStream\n\
              baseurl=https://mirror.centos.org/centos/8/AppStream/x86_64/os/\n\
              enabled=1\n\
              gpgcheck=1\n\
              gpgkey=https://mirror.centos.org/centos/8/updates/x86_64/Packages/repomd.xml" > /etc/yum.repos.d/CentOS-AppStream.repo && \
              yum clean all && \
              yum makecache
RUN           yum install epel-release -y
COPY          mongo.repo /etc/yum.repos.d/mongo.repo
RUN           yum install git mysql mongodb-org-shell -y
COPY          run.sh /
ENTRYPOINT    [ "bash", "/run.sh" ]