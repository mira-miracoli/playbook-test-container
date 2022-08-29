FROM rockylinux:9
# Install requirements.
RUN yum -y install rpm dnf-plugins-core \
 && yum -y update \
 && yum -y install \
      epel-release \
      initscripts \
      sudo \
      which \
      hostname \
      libyaml \
      python3 \
      python3-pip \
      python3-pyyaml \
      openssh-server \
 && yum clean all

# Upgrade pip to latest version.
RUN pip3 install --upgrade pip

# Install Ansible via Pip.
RUN pip3 install ansible
RUN groupadd ansible && useradd -g ansible -p test123 -ms /bin/bash ansible 
WORKDIR /home/ansible
COPY id_rsa.pub .ssh/authorized_keys
RUN chown ansible:ansible .ssh/authorized_keys && \
    chmod 600 .ssh/authorized_keys
EXPOSE 22
ENTRYPOINT [ "/usr/sbin/init" ]
