#!/bin/bash

cd /chappie
cd chappie-common
git checkout master
git pull
mvn clean install
cd ../
cd chappie-server
git checkout master
git pull
mvn clean install

java -jar $(ls /chappie/chappie-server/target/chappie-server*.jar | head -n 1)

