#!/bin/bash

if [ ! -f /.tomcat_admin_created ]; then
    /create_tomcat_admin_user.sh
fi
if [ ! -f /.tomcat_configured ]; then
    /config_tomcat.sh
fi

exec ${CATALINA_HOME}/bin/catalina.sh run
