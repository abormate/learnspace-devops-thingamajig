# Jenkins CLI to interact with install service from shell -- in this example, one that connects to localhost with credentials
java -jar jenkins-cli.jar -s http://localhost:8085 -auth 'admin:Adm!n321'

# following command lists all installed plugins for Jenkins
java -jar jenkins-cli.jar -s http://localhost:8085 -auth 'admin:Adm!n321' list-plugins

--
