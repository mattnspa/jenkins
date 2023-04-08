FROM jenkins/jenkins:2.387.1

# install docker
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins

# install plugins
COPY --chown=jenkins:jenkins config/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

# define casc dir
ENV CASC_JENKINS_CONFIG=/var/jenkins_home/casc_configs

# disable startup wizard
ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false

# create .ssh dir
RUN mkdir /var/jenkins_home/.ssh