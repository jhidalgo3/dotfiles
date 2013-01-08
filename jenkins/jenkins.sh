#!/bin/bash

http_port=9080
ajp_port=9083

echo 
echo 
echo 
echo "Starting Jenkins on $http_port"
echo 
echo 
echo 
java -DJENKINS_HOME=$PWD/home -jar jenkins.war --httpPort=$http_port --ajp13Port=$ajp_port
