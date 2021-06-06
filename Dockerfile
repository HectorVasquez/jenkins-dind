FROM jenkins/jenkins:lts

ARG HOST_UID=1001
ARG HOST_GID=1001

USER root
RUN curl -sSL https://get.docker.com/ | sh
    
RUN usermod -u $HOST_UID jenkins
RUN groupmod -g $HOST_GID docker
RUN usermod -aG docker jenkins

ENV JAVA_OPTS=-Xmx3g\ -Xms2G
USER jenkins
EXPOSE 8080 50000
VOLUME ["/var/jenkins_home"]