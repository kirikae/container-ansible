FROM registry.access.redhat.com/ubi8/ubi-minimal

RUN microdnf update -y \
  && microdnf install -y python3

RUN /usr/bin/python3 -m pip install setuptools-rust wheel \
  && /usr/bin/python3 -m pip install --upgrade pip
RUN /usr/bin/python3 -m pip install ansible

WORKDIR /ansible
