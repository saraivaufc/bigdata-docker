FROM ubuntu:18.04

MAINTAINER saraivaufc <www.saraiva.dev>

WORKDIR /opt/

RUN apt-get -qq update -y

RUN apt-get -qqy install axel openssh-server openssh-client sudo

RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers

# SSH Keys
RUN mkdir -p /root/.ssh/
COPY ./ssh_keys/* /root/.ssh/
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
RUN chmod 0600 /root/.ssh/id_rsa
RUN /usr/bin/ssh-keygen -A

# To download Java
RUN apt install -y openjdk-8-jdk

# To download Kafka
RUN axel http://mirror.nbtelecom.com.br/apache/kafka/2.5.0/kafka_2.12-2.5.0.tgz
RUN tar -xvzf kafka_2.12-2.5.0.tgz
RUN mv kafka_2.12-2.5.0 ./kafka

# BASH FILES
COPY ./bash_files/* /root/

# KAFKA FILES
COPY ./kafka-conf-files/* ./kafka/conf/

# ENTRYPOINT
COPY ./docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]

# Input
EXPOSE 19091 19092

# Output
EXPOSE 9091 9092
