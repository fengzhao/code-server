FROM codercom/code-server:latest
# COPY JDK和MAVEN
COPY jdk1.8.0_201 /usr/local/jdk1.8.0_201/
COPY apache-maven-3.6.3 /usr/local/apache-maven-3.6.3/
# code-server配置文件 插件
 COPY extensions /root/.local/share/code-server/extensions/
 COPY settings.json /root/.local/share/code-server/User/
# Env
ENV JAVA_HOME=/usr/local/jdk1.8.0_201 \
    JRE_HOME=/usr/local/jdk1.8.0_201/jre \
    PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin \
    CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib \
    MAVEN_HOME=/usr/local/apache-maven-3.6.3

ENV PATH=$MAVEN_HOME/bin:$PATH

WORKDIR /home/coder/project
# 容器启动code-server：指定插件目录，指定中文，指定免密登录
ENTRYPOINT ["code-server","--locale","zh-cn","--host","0.0.0.0","--port","8080", "--user-data-dir", "/home/coder","--cert",""]