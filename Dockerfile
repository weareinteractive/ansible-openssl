FROM ansible/ubuntu14.04-ansible:latest

WORKDIR /root

ADD test.yml /root/test.yml
ADD ansible.cfg /root/.ansible.cfg

RUN git clone https://github.com/jacoelho/ansible-openssl.git \
  && ansible-playbook -c local test.yml