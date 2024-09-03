FROM          dokken/centos-8:pr-81
ENTRYPOINT    [ "bash", "/run.sh" ]
RUN           yum install maven -y


