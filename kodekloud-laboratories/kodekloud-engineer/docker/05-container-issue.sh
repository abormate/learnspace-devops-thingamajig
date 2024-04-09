# ---------------------------------------------- #
#
# -- Troubleshooting Issue with Container -- Docker --
#
# ---------------------------------------------- #

: '
There is a static website running within a container named nautilus, 
this container is running on App Server 1. Suddenly, we started 
facing some issues with the static website on App Server 

1. Look into the issue to fix the same, you can find more details
below:


Containers volume /usr/local/apache2/htdocs is mapped with the 
hosts volume /var/www/html.

2. The website should run on host port 8080 on App Server 1 
i.e command curl http://localhost:8080/ should work on 
App Server 1.

'

ssh tony@stapp01

docker ps -a

docker start nautilus

