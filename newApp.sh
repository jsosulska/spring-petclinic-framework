#!/usr/bin/env bash


oc new-app -e MYSQL_USER=petclinic -e MYSQL_PASSWORD=petclinic -e MYSQL_DATABASE=petclinic openshift/mysql-55-centos7
oc createSecret petclinc-secrets --from-




1. automated db creation and store value in a secret

one button
    new database with random password
    create secret
    point petclinic to that database

oc create configmap petclinic-db-config --from-literal=JDBC_URL=jdbc:mysql://mysql-55-centos7.myproject.svc:3306/petclinic --from-literal=JDBC_USERNAME=petclinic


oc expose svc petclinic


oc new-app --image-stream=myproject/petclinic:2.0.3 --name=petclinic
