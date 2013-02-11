#!/bin/bash

http_port=9080
ajp_port=9083

echo 
echo 
echo 
echo "Starting Hudson on $http_port"
echo 
echo 
echo 
java -DHUDSON_HOME=$PWD/home -jar hudson.war --httpPort=$http_port --ajp13Port=$ajp_port
