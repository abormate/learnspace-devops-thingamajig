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

#
# How to invoke or use a variable? We call it for example, from inside a Playbook, using double-curly braces {{ }} 
# The following is a playbook example with a variable define also within the playbook and later on, the same dns_server variable is invoked.

-
  name: Add DNS server to resolv.conf
  hosts: localhost
  vars:
    dns_server: 10.1.250.10
  tasks:
    - lineinfile
      path: /etc/resolv.conf
      line: 'nameserver {{ dns_server }}'
      
#
# Another example that is more organized is to use an external or separate variables file for a specific host, using "Jinja2" templating or the double-curly braces notation
# The following is an example of a playbook with a separate or external variables file
#

-
  name: Set Firewall Configurations
  hosts: web
  tasks:
  - firewalld:
      service: https
      permanent: true
      state: enabled
  - firewalld:
      port: '{{ http_port }}'/tcp
      permanent: true
      state: disabled
  - firewalld:
      port: '{{ snmp_port }}'/udp
      permanent: true
      state: disabled
  - firewalld:
      source: '{{ inter_ip_range }}'/24
      zone: internal
      state: enabled
 
 #
 # And the separate variables file defining the invoked variables from the above playbook is the following
 #
    
 
