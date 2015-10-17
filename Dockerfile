FROM imagine10255/centos6-lnmp:latest
MAINTAINER Imagine Chiu imagine10255@gmail.com

ENV DB_DIR=/usr/local/mariadb/var \
    APP_DIR=/home/wwwroot/website
    
# 建立相關設定檔到容器
ADD . /opt/
WORKDIR /opt

# 建立預設首次進入容器初始化的命令執行檔
RUN chmod 755 /opt/bash/init.sh && echo "/opt/bash/init.sh" >> /root/.bashrc

# 覆蓋容器並使用客製化設定檔資料
RUN cp ./config/nginx/nginx.conf /usr/local/nginx/conf/nginx.conf && \
    cp ./config/php/php.ini /usr/local/php/etc/php.ini && \
    cp ./config/mysql/my.cnf /etc/my.cnf && \
    cp -r ./config/index.html /home/wwwroot/default
    
# 建立網站預設資料夾
RUN mkdir -p ${APP_DIR}

# 建立資料庫預設資料
RUN mkdir -p /opt/backup && \
    cp -r ${DB_DIR} /opt/backup/mysql-data

#--------------------------------------------------
# 將進入容器預設目錄設定為專案路徑
WORKDIR ${APP_DIR}

# 預設對外開放通訊埠
EXPOSE 3306
EXPOSE 80 81 82

# 預設HOST映射資料夾
VOLUME ["${APP_DIR}","${DB_DIR}"]

# 預設啟動執行命令
CMD ["bash"]