# --------------------------------------------- #
#
# -- Linux ServerOps -- Kode Kloud -- Find -- 
#
# --------------------------------------------- #

: '
During a routine security audit, the team identified an issue on the Nautilus App Server. 
Some malicious content was identified within the website code. After digging into the 
issue they found that there might be more infected files. 

Before doing a cleanup they would like to find all similar files and copy them to a safe 
location for further investigation. Accomplish the task as per the following requirements:


a. On App Server 2 at location /var/www/html/beta find out all files (not directories) 
having .php extension.

b. Copy all those files along with their parent directory structure to location /beta on 
same server.

c. Please make sure not to copy the entire /var/www/html/beta directory content.

'

cat /etc/os-release

ssh steve@stapp02

touch /var/www/html/sigma

# -- Ansible approach -- please note, Ansible playbooks expect YAML

- hosts: nautilus_app3
  gather_facts: false
  become: true

  vars:
    src_dir: /var/www/html/media
    dest_dir: /media
    file_ext: php

  tasks:
    - name: Find all .{{ file_ext }} files
      find:
        path: "{{ src_dir }}"
        patterns: "*{{file_ext}}"
        recurse: true
      register: found_files

    - name: Create destination directories
      file:
        path: "{{ dest_dir }}/{{ item.path | dirname }}"
        state: directory
      loop: '{{ found_files.files }}'
      loop_control:
        label: '{{ item.path | dirname }}'
    - name: Copy all found files to {{ dest_dir }}
      copy:
        dest: "{{ dest_dir }}{{ item.path | dirname }}"
        remote_src: yes
        src: "{{ item.path }}"
      with_items: "{{ found_files.files }}"