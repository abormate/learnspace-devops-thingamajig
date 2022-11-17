// python 3 introduced many fixes for problems with python 2. however, apps developed on python2 can't be run on python 3 

// install python on CentOS
yum install python3 -y

// you can install python2 and python 3 simultaneously on a system

// pip package managers for python install dependencies for python apps/systems. However, for python2 -- a specific pip version exists called "pip2". 
// For python3, pip version 3 exists called "pip3". pip2 and pip3 do not intermix, and install their dependencies on different folders.

// to show where something installed by pip was installed -- for this example, for flask
pip show flask

// if you need to trouble where something was installed you can run -- these are the paths where python would look for packages
python2 -c "import sys; print(sys.path)"
