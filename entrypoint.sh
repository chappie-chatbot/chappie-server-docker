#!/bin/bash

cd /chappie
cd chappie-common
git checkout master
git pull
mvn clean install -DskipTests
cd ../
cd chappie-webui
git checkout master
git pull
cd ../
cd chappie-server
git checkout master
git pull
pwd
mkdir -p src/main/resources/static/
cp ../chappie-webui/src/* src/main/resources/static/
mvn clean install -DskipTests

java -jar $(ls /chappie/chappie-server/target/chappie-server*.jar | head -n 1)

