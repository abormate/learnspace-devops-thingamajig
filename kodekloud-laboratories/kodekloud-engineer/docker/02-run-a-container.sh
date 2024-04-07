# ------------------------------------- #
#
# -- Docker -- Run a Container --
#
# ------------------------------------- #

: '
Nautilus DevOps team is testing some applications deployment on 
some of the application servers. They need to deploy a nginx 
container on Application Server 2. Please complete the task as 
per details given below:

On Application Server 2 create a container named nginx_2 using 
image nginx with alpine tag and make sure container is in running 
state.

'

ssh steve@stapp02

docker create --help

docker images

docker pull nginx

docker pull nginx:alpine

docker images

docker create -i --name nginx_2 nginx:alpine

docker ps -a