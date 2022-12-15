# Variables store information that varies across each host
#
#
# Example: Variables in an inventory file example from previous lectures. 
# For the following, "ansible_host", "ansible_connection", and "ansible_ssh_pass" are variables.

web1 ansible_host=server1.company.com   ansible_connection=ssh    ansible_ssh_pass=P@ssw
db   ansible_host=server2.company.com   ansible_connection=ssh    ansible_ssh_pass=P@ssw

