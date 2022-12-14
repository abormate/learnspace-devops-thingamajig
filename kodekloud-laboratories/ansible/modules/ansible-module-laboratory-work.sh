# task 1
:'
Update the playbook with a play to Execute a script on all web server nodes. The script is located at /tmp/install_script.sh
Use the Script module
'

# start ansible shell script from this line
-

    name: 'Execute a script on all web server nodes'
    hosts: web_nodes
    tasks:
        -
            name: 'Execute a script on all web server nodes'
            script: /tmp/install_script.sh
            
# end ansible script on this line for question/task 1
#
#
#
# task 2
:'
Update the playbook to add a new task to start httpd services on all web nodes
Use the Service module
'
#
#
# following line is actual ansible script shell

-
    name: 'Execute a script on all web server nodes'
    hosts: web_nodes
    tasks:
        -
            name: 'Execute a script on all web server nodes'
            script: /tmp/install_script.sh
        -
            name: 'Start httpd services'
            service: 'name=httpd state=started'

# end of shell script for ansible task 2
#
#
#
#
