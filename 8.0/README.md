# Howto: Create Tomcat8 service


```
git clone https://github.com/Predictia/docker-tomcat.git
cd docker-tomcat/8.0
sudo docker build --tag="predictia/tomcat:8.0" .
sudo docker run -d --name="tomcat0" -p 28080:8080 -p 28009:8009 -e TOMCAT_PASS='myPass' -e TOMCAT_OPTS_XMX='1512' predictia/tomcat:8.0
```
