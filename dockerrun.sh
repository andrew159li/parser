#!/bin/sh
# unzip apache-jena-4.5.0.tar.gz
echo 'Unzipping apachejena'
tar -xf apache-jena-4.5.0.tar.gz
echo 'Done unzipping apachejenaexit'

# add PATHS
echo 'Adding paths'
export JENA_HOME='/app/apache-jena-4.5.0'
export PATH=$PATH:$JENA_HOME/bin
echo 'Done adding paths'

# do codeontology stuff here
echo 'starting codeontology setup'
cd /app/parser
mvn package -DskipTests
echo 'done with codeontology setup'

echo 'Test ApacheJena with sparql --version'
echo 'Test Codeontology with ./codeontology --help'
