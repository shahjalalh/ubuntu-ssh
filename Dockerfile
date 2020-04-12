FROM ubuntu:16.04

# Installing ansible
RUN apt-get update
RUN apt-get -y install software-properties-common && \
    apt-add-repository --yes --update ppa:ansible/ansible && \
    apt-get -y install ansible && \
    apt-get -y install curl

# Installing PIP and Virtual Environment
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py
RUN python3 get-pip.py

RUN pip install virtualenv

# Installing sudo
RUN apt-get -y install sudo
RUN mkdir /home/workspace

# SSH configuration
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:admin1234' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]