# Variables store information that varies across each host
#
#
# Example: Variables in an inventory file example from previous lectures. 
# For the following, "ansible_host", "ansible_connection", and "ansible_ssh_pass" are variables.

web1  ansible_host=server1.company.com    ansible_connection=ssh    ansible_ssh_pass=P@ssw
db    ansible_host=server2.company.com    ansible_connection=winrm  ansible_ssh_pass=P@ssw
web2  ansible_host=server3.company.com    ansible_connection=ssh    ansible_ssh_pass=P@ssw

#
# Another example, could be done on a Playbook
# Whereas the module for "vars" define the variable in the following playbook

-
  name: Add DNS server to resolv.conf
  hosts: localhost
  vars:
    dns_server: 10.1.250.10
  tasks:
    - lineinfile
      path: /etc/resolv.conf
      line: 'nameserver 10.1.250.10'
   
#
# Finally, one more example is that you can define variables in a separate "variables" file through a key-value pair.
# For the following, an example content of an external or separate "variables" file

variable1: value1
variable2: value2

