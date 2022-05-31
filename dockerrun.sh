#!/bin/sh
cd ..
# unzip apache-jena-4.5.0.tar.gz
tar -xf apache-jena-4.5.0.tar.gz
# add PATHS
export JENA_HOME='/app/apache-jena-4.5.0'
export PATH=$PATH:$JENA_HOME/bin

# do codeontology stuff here
cd /app/parser
mvn package -DskipTests

echo 'Test ApacheJena with sparql --version'
sparql --version
echo 'Test Codeontology with ./codeontology --help'
