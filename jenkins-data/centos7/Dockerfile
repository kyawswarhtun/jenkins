FROM centos:7

RUN yum -y install openssh-server mysql
#RUN useradd remote_user && \
#    echo "1234" | passwd remote_user --stdin && \
#    mkidr /home/remote_user/.ssh && \
#    chmod 700 /home/remote_user/.ssh

RUN useradd remote_user && \
    echo "remote_user:1234" | chpasswd 
    
USER remote_user
RUN mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys


USER root
RUN chown remote_user:remote_user -R /home/remote_user/.ssh/authorized_keys && \
    chmod 600 /home/remote_user/.ssh/authorized_keys


# RUN yum -y install mysql gcc openssl-devel bzip2-devel libffi-devel zlib-devel xz-devel wget make
# RUN cd /usr/src && \
#     wget https://www.python.org/ftp/python/3.7.11/Python-3.7.11.tgz  && \
#     tar xzf Python-3.7.11.tgz
# RUN cd /usr/src/Python-3.7.11 && ./configure && make altinstall
# RUN rm -rf /usr/src/Python-3.7.11.tgz

# Deprecation Notice with python 2.7 
RUN curl -O  https://bootstrap.pypa.io/pip/2.7/get-pip.py && \
    python get-pip.py && \
    pip install awscli --upgrade

RUN ssh-keygen -A
CMD  /usr/sbin/sshd -D 

