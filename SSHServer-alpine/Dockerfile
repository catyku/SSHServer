FROM alpine:latest

ARG USER
ARG PWD
RUN apk update && apk upgrade 
RUN apk add openssh-server 
RUN apk add netcat-openbsd tzdata 
RUN ln -s /usr/share/zoneinfo/Asia/Taipei /etc/localtime 
RUN apk cache clean
RUN adduser   -u 1000 ${USER} ; echo ${USER}:${PWD} | chpasswd 
#RUN echo "$USERNAME ALL=(ALL) ALL" > /etc/sudoers.d/${USER} && chmod 0440 /etc/sudoers.d/${USER}
#RUN  echo 'ubuntu:ubuntu' | tc12834843
#RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \ /etc/sudoers
#RUN echo "PermitRootLogin no" >> /etc/ssh/sshd_config
#RUN echo "PasswordAuthentication  no" >> /etc/ssh/sshd_config
#RUN echo "GatewayPorts yes" >> /etc/ssh/sshd_config
#RUN echo "AllowTCPForwarding yes" >> /etc/ssh/sshd_config  
#RUN echo "SyslogFacility AUTH" >> /etc/ssh/sshd_config
#RUN echo "LogLevel INFO" >> /etc/ssh/sshd_config

RUN mkdir /home/${USER}/.ssh
COPY ./id_rsa.pub /home/${USER}/.ssh/id_rsa.pub
RUN cat /home/${USER}/.ssh/id_rsa.pub >> /home/${USER}/.ssh/authorized_keys
RUN chmod -R go= /home/${USER}/.ssh
RUN chown -R ${USER}:${USER} /home/${USER}/.ssh
#RUN rc-update add sshd
#RUN rc-service sshd start
#EXPOSE 22
#CMD ["exec","/usr/sbin/sshd","-D","-e","'$@'"]
#COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 22
#CMD ["exec","/usr/sbin/sshd","-D","-e","'$@'"]
COPY ./entrypoint.sh /
RUN ssh-keygen -A 
