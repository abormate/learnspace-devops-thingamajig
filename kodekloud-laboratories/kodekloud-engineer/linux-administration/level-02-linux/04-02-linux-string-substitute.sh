# ------------------------------------------------ #
#
#  -- Linux SysOps -- String Substitute -- 
#
# ------------------------------------------------ #

: '
There is some data on Nautilus App Server 3 in Stratos DC. 
Data needs to be altered in several of the files. On Nautilus 
App Server 3, alter the /home/BSD.txt file as per details given 
below:

a. Delete all lines containing word copyright and save results in 
/home/BSD_DELETE.txt file. (Please be aware of case sensitivity)

b. Replace all occurrence of word from to for and save results in 
/home/BSD_REPLACE.txt file.

Note: Lets say you are asked to replace word to with from. In that case, make sure not to alter any words containing the string itself; for example upto, contributor etc.

'

cat  /etc/os-release

# --------------------- #
# -- Ansible Solution --
# --------------------- #

: '
- hosts: nautilus_app3
  gather_facts: false
  become: true

  vars:
    src_file: /home/BSD.txt
    del_file: /home/BSD_DELETE.txt
    del_word: software
    rep_file: /home/BSD_REPLACE.txt
    rep_src_word: the
    rep_dest_word: for
  tasks:
    - name: Copy {{ src_file }} to {{ del_file }}
      copy:
        remote_src: true
        src: "{{ src_file }}"
        dest: "{{ del_file }}"
    - name: Delete all lines contain {{ del_word }}
      lineinfile:
        path: "{{ del_file }}"
        state: absent
        regexp: "{{ del_word }}"
    - name: Copy {{ src_file }} to {{ rep_file }}
      copy:
        remote_src: true
        src: "{{ src_file }}"
        dest: "{{ rep_file }}"
    - name: Replace all {{ rep_src_word }} to {{ rep_dest_word }}
      replace:
        path: "{{ rep_file }}"
        regexp: '\b{{ rep_src_word }}\b'
        replace: "{{ rep_dest_word }}"
'

: '
There is some data on Nautilus App Server 2 in Stratos DC. Data needs to be altered in 
several of the files. On Nautilus App Server 2, alter the /home/BSD.txt file as per 
details given below:

a. Delete all lines containing word following and save results in /home/BSD_DELETE.txt 
file. (Please be aware of case sensitivity)

b. Replace all occurrence of word and to them and save results in /home/BSD_REPLACE.txt 
file.

Note: Let's say you are asked to replace word to with from. In that case, make sure not to alter any words containing the string itself; for example upto, contributor etc.

'

