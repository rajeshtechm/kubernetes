
FROM centos

MAINTAINER rajeswararao.kondapalli@gmail.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.30/bin/apache-tomcat-9.0.30.zip
#RUN unzip apache*.zip
RUN yum install zip
RUN unzip apache*.zip
RUN mv apache-tomcat-9.0.30 /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/rajeshtechm/kubernetes/blob/master/sparkjava-hello-world-1.0.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]

