: '
Task -- Run apache tomcat on all IP interfaces and port 9090 on host01 server.

We already downloaded apache tomcat under /opt/apache-tomcat-8.5.53 directory. Modify necessary files and start tomcat.

Tomcat is much like Apache HTTPD only it specializes in running Java
'

# step 1 -- cd to /opt
cd /opt/

# step 2 -- change port 8080 listening instead to port 9090 in config file for tomcat
sudo sed -i 's/8080/9090/g' apache-tomcat-8.5.53/conf/server.xml 

