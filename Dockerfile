FROM imagine10255/centos6-lnmp:latest
MAINTAINER Imagine Chiu imagine10255@gmail.com

ENV DB_DIR=/usr/local/mariadb/var \
    APP_DIR=/home/wwwroot/website
    
# �إ߬����]�w�ɨ�e��
ADD . /opt/
WORKDIR /opt

# �إ߹w�]�����i�J�e����l�ƪ��R�O������
RUN chmod 755 /opt/bash/init.sh && echo "/opt/bash/init.sh" >> /root/.bashrc

# �л\�e���èϥΫȻs�Ƴ]�w�ɸ��
RUN cp ./config/nginx/nginx.conf /usr/local/nginx/conf/nginx.conf && \
    cp ./config/php/php.ini /usr/local/php/etc/php.ini && \
    cp ./config/mysql/my.cnf /etc/my.cnf && \
    cp -r ./config/index.html /home/wwwroot/default
    
# �إߺ����w�]��Ƨ�
RUN mkdir -p ${APP_DIR}

# �إ߸�Ʈw�w�]���
RUN mkdir -p /opt/backup && \
    cp -r ${DB_DIR} /opt/backup/mysql-data

#--------------------------------------------------
# �N�i�J�e���w�]�ؿ��]�w���M�׸��|
WORKDIR ${APP_DIR}

# �w�]��~�}��q�T��
EXPOSE 3306
EXPOSE 80 81 82

# �w�]HOST�M�g��Ƨ�
VOLUME ["${APP_DIR}","${DB_DIR}"]

# �w�]�Ұʰ���R�O
CMD ["bash"]