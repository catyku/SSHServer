FROM ubuntu:22.04

ARG USER
ARG PWD
#RUN echo "Asia/Taipei" > /etc/timezone
#RUN dpkg-reconfigure -f noninteractive tzdata
RUN apt update && apt install openssh-server sudo netcat iputils-ping net-tools nano  tzdata rsyslog fail2ban  -y
RUN echo "Asia/Taipei" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN apt-get clean
RUN useradd -rm -d /home/${USER} -s /bin/bash  -u 1000 ${USER} -p "$(openssl passwd -1 ${PWD})"
#RUN  echo 'ubuntu:ubuntu' | tc12834843
#RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \ /etc/sudoers
#RUN echo "PermitRootLogin no" >> /etc/ssh/sshd_config
#RUN echo "PasswordAuthentication  no" >> /etc/ssh/sshd_config
#RUN echo "GatewayPorts yes" >> /etc/ssh/sshd_config

RUN mkdir /home/${USER}/.ssh
#COPY ./id_rsa.pub /home/${USER}/.ssh/id_rsa.pub
#RUN cat /home/${USER}/.ssh/id_rsa.pub >> /home/${USER}/.ssh/authorized_keys
RUN chmod -R go= /home/${USER}/.ssh
RUN chown -R ${USER} /home/${USER}/.ssh
RUN mkdir /run/sshd
#RUN service ssh start
#RUN /usr/sbin/rsyslogd
#RUN service rsyslog start
EXPOSE 22
## -f -x -v
CMD ["sh","-c","/usr/sbin/rsyslogd  ; /usr/bin/fail2ban-server -xf -v start ;/usr/sbin/sshd -D; "]

