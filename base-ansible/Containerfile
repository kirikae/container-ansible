FROM registry.access.redhat.com/ubi8/ubi AS container-ansible-build
RUN mkdir -p /mnt/rootfs
RUN yum repolist
RUN yum install\
 coreutils-single glibc-minimal-langpack\
 python38 libgcc vim\
 --installroot /mnt/rootfs\
 --releasever 8\
 --setopt=module_platform_id=platform:el8\
 --setopt=install_weak_deps=false\
 --setopt=tsflags=nodocs\
 --setopt=override_install_langs=en_US.utf8\
 -y
RUN curl https://bootstrap.pypa.io/get-pip.py -o /mnt/rootfs/get-pip.py
RUN rm -rf /mnt/rootfs/var/cache/*
RUN rm -rf /mnt/rootfs/var/lib/rpm

FROM scratch AS container-ansible
MAINTAINER Ben Colby-Sexton bcs@redhat.com
LABEL org.opencontainers.image.authors="Ben Colby-Sexton bcs@redhat.com"
LABEL name=container-ansible
LABEL org.opencontainers.image.base.name=container-ansible
LABEL description="A basic container for executing Ansible. Should usually be run interactively."

COPY --from=container-ansible-build /mnt/rootfs/ /
RUN python3 get-pip.py
RUN rm get-pip.py
RUN python3 -m pip install setuptools-rust wheel
RUN python3 -m pip install ansible paramiko "pywinrm>=0.3.0" netaddr
RUN python3 -m pip uninstall setuptools-rust wheel pip -y

WORKDIR /ansible
VOLUME /ansible
CMD /bin/sh
