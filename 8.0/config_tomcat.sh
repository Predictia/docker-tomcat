#!/bin/bash

if [ -f /.tomcat_configured ]; then
    echo "Tomcat already configured"
    exit 0
fi

echo "=> Configuring CATALINA_OPTS"
PID_FILE=${CATALINA_HOME}/pid
sed -i "1 a\export CATALINA_PID=\"$PID_FILE\"" ${CATALINA_HOME}/bin/catalina.sh
CATALINA_OPTS="-XX:PermSize=${TOMCAT_OPTS_PERMSIZE}m -XX:MaxPermSize=${TOMCAT_OPTS_MAXPERMSIZE}m -Xms${TOMCAT_OPTS_XMS}m -Xmx${TOMCAT_OPTS_XMX}m"
sed -i "1 a\export CATALINA_OPTS=\"$CATALINA_OPTS\"" ${CATALINA_HOME}/bin/catalina.sh
echo "=> Done!"
touch /.tomcat_configured
