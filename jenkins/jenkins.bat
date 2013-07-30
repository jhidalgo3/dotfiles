set http_port=9080
set ajp_port=9084

java -DJENKINS_HOME=%cd%\\home -jar jenkins.war --httpPort=%http_port% --ajp13Port=%ajp_port%
