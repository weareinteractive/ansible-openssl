FROM ansible/ubuntu14.04-ansible:latest

WORKDIR /root

ADD test.yml /root/test.yml
ADD ansible.cfg /root/.ansible.cfg

#RUN git clone -b development https://github.com/jacoelho/ansible-openssl.git \

ADD . /root/ansible-openssl

RUN groupadd rails \
  && useradd -g rails rails \
  && ansible-playbook -vv -c local test.yml