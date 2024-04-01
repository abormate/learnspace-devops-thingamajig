# --------------------------------------------- #
#
# -- Ansible -- Copy Module -- Kode Kloud Engineer --
#
# --------------------------------------------- #

: '
There is data on jump host that needs to be copied on all application servers 
in Stratos DC. Nautilus DevOps team want to perform this task using Ansible. 

Perform the task as per details mentioned below:

a. On jump host create an inventory file /home/thor/ansible/inventory and add 
all application servers as managed nodes.


b. On jump host create a playbook /home/thor/ansible/playbook.yml to copy 
/usr/src/sysops/index.html file to all application servers at location 
/opt/sysops.


Note: Validation will try to run the playbook using command ansible-playbook 
-i inventory playbook.yml so please make sure the playbook works this way 
without passing any extra arguments.


'

ls -la

cd ansible/

cat > inventory

: '
# Enter the following inventory values...

stapp01 ansible_host=stapp01 ansible_user=tony ansible_ssh_pass=<password>
stapp02 ansible_host=stapp02 ansible_user=steve ansible_ssh_pass=<password>
stapp03 ansible_host=stapp03 ansible_user=banner ansible_ssh_pass=<password>

# after enter and stop cat ^C
'

ansible all -m ping -i inventory

ansible all -i inventory -a "ls -l /opt/itadmin"

cat > playbook.yaml

: '
 - name: "Copying index file to app servers"
     become: yes
     hosts: all
     tasks:
          - name: "Copy index.html"
            copy:
               src: /usr/src/itadmin/index.html
               dest: /opt/itadmin/

'

ansible-playbook -i inventory playbook.yaml

# check if file is present inside dest folder
ansible all -i inventory -a "ls -l /opt/itadmin"
