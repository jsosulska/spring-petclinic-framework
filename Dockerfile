FROM maven:3.5-alpine AS BUILD_IMAGE
ENV APP_HOME=/root
RUN mkdir -p $APP_HOME/src/
VOLUME $APP_HOME/.m2/repository
COPY src/ $APP_HOME/src
COPY pom.xml $APP_HOME/pom.xml
RUN cd $APP_HOME && mvn clean package -DskipTests
FROM jboss/wildfly:11.0.0.Final
COPY --from=BUILD_IMAGE /root/target/petclinic.war /opt/jboss/wildfly/standalone/deployments/petclinic.war
EXPOSE 8080
ENV JDBC_PASSWORD=petclinic \
    DB_SCRIPT=mysql \
    JDBC_DRIVER_CLASS_NAME=com.mysql.jdbc.Driver \
    JPA_DATABASE=MYSQL \
    JDBC_USERNAME=root \
    JDBC_URL=jdbc:mysql://mysql:3306/petclinic
