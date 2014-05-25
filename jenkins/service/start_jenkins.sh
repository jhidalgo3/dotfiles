#!/bin/bash

http_port=9080
ajp_port=9083
JAVA=/usr/lib/jvm/java/bin/java
JENKINS_HOME=/srv/jenkins/
JENKINS_WAR=$JENKINS_HOME/jenkins.war
JENKINS_LOG=$JENKINS_HOME/jenkins.log
#nohup nice $JAVA -jar $JENKINS_WAR > $JENKINS_LOG 2>&1 &

echo 
echo 
echo 
echo "Starting Jenkins on $http_port"
echo 
echo 
echo 
$JAVA -DJENKINS_HOME=$JENKINS_HOME/home  -jar $JENKINS_WAR --prefix=/jenkins --httpPort=$http_port --ajp13Port=$ajp_port > $JENKINS_LOG 2>&1 &
