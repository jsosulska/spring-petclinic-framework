#!/usr/bin/env bash
oc new-app -e MYSQL_USER=petclinic -e MYSQL_PASSWORD=petclinic -e MYSQL_DATABASE=petclinic openshift/mysql-55-centos7
oc create configmap petclinic-db-config --from-literal=JDBC_URL=jdbc:mysql://mysql-55-centos7.myproject.svc:3306/petclinic --from-literal=JDBC_USERNAME=petclinic
oc new-app stein321/petclinic:2.0.2
