# ----------------------------------------- #
#
# -- Docker -- Delete a Container --
#
# ----------------------------------------- #

: '
One of the Nautilus project developers created a container on App 
Server 1. This container was created for testing only and now we 
need to delete it. Accomplish this task as per details given 
below:

Delete a container named kke-container, its running on App 
Server 1 in Stratos DC.

'

ssh tony@stapp01

docker ps -a

docker stop kke-container

docker rm kke-container

docker ps -a

