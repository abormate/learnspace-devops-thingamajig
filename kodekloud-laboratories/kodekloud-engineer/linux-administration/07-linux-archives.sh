# --------------------------------------- #
#
# -- Linux Archives -- Practice Laboratory --
#
# --------------------------------------- #

: '
On Nautilus storage server in Stratos DC, there is a storage location 
named /data, which is used by different developers to keep their data 
(non confidential data). 

One of the developers named ravi has raised a 
ticket and asked for a copy of their data present in /data/ravi directory 
on storage server. /home is a FTP location on storage server itself 
where developers can download their data. Below are the instructions 
shared by the system admin team to accomplish this task.



a. Make a ravi.tar.gz compressed archive of /data/ravi directory and move 
the archive to /home directory on Storage Server.

'

# go to directory /data/ravi

# archive files into tar.gz
tar czvf ravi.tar.gz .

# move archive to /home/ directory
mv ravi.tar.gz /home/