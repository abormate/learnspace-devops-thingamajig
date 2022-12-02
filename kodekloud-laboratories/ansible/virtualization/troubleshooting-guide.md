Only 32bit VMs are listed in Virtual Box
While creating VMs in the Virtual box if only 32-bit VMS are listed, kindly check on the following:

Check if Virtualization is enabled on your system. For this, you must access the BIOS of your laptop and enable Virtualization if it’s not already enabled.
Check if Hyper-V is enabled on your system. If it is, ensure that it is disabled as two virtualization technologies cannot co-exist.

Issues installing Ansible and its dependencies on Debian
If you are running into issues installing Ansible on Debian VM then please follow the below troubleshooting guide.

Once the Debian VM is up and running make the following changes to the /etc/apt/sources.list file to get the Ansible installation working right.

Comment the line starting deb cdrom
Uncomment the bottom two lines starting deb and deb-src
Add the below two lines:
deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main
deb http://ftp.de.debian.org/debian sid main
