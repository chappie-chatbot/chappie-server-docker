#!/bin/bash

cd /chappie

git clone https://github.com/chappie-chatbot/chappie-common.git chappie-common
git clone https://github.com/chappie-chatbot/chappie-webui.git chappie-webui
git clone https://github.com/chappie-chatbot/chappie-server.git chappie-server

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

