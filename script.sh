mvn package

mv ./target/Voyage-1.0-SNAPSHOT.war /home/fabien/Documents/apache-tomcat-10.1.15/webapps/

@echo "shutdown tomcat"
/home/fabien/Documents/apache-tomcat-10.1.15/bin/shutdown.bat
@echo "start tomcat"
/home/fabien/Documents/apache-tomcat-10.1.15/bin/startup.bat
