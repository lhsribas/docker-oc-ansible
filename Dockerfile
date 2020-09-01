FROM registry.access.redhat.com/ubi8

LABEL MAINTAINER Luiz Ribas<lribas@redhat.com> \
      com.redhat.component="openshift-commandline-4.4.7-with-ansible-2.9" \
      name="openshift/openshift-commandline-4.4.7-with-ansible-2.9" \
      version="1.0" \
      architecture="x86_64" \
      release="1" \
      io.k8s.display-name="Openshift Command Line with Ansible" \
      io.k8s.description="Openshift Command Line with Ansible" \
      io.openshift.tags="openshift4, openshift command line,ansible"

ENV OC_VERSION=4.4.7 \
    ANSIBLE_VERSION=2.9 \
    HOME=/home/tool-box

RUN yum -y update \
    && INSTALL_PKGS="git vim unzip python36" \
    && yum -y install $INSTALL_PKGS \
    && yum clean all \
    && mkdir -m 775 $HOME \
    && chmod 775 /etc/passwd \
    && pip3 install git+https://github.com/ansible/ansible.git@stable-${ANSIBLE_VERSION} \
    && curl --fail -sL https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OC_VERSION}/openshift-client-linux-${OC_VERSION}.tar.gz | tar -C /usr/local/bin/ -xzf -

WORKDIR $HOME

ADD ./root /

RUN chmod u+x /usr/local/bin/run && \
    rm -rf $HOME/.cache

USER 1001

ENTRYPOINT ["/usr/local/bin/run"]
CMD ["sleep", "infinity"]