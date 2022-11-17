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

// chain01 -- if you need to install several dependencies with pip -- you can write the names of the software packages along with the versions needed in a text file
// requirements.txt -- example
Flask==0.10.1
Jinja2==2.7.3
MarkupSafe==0.23
Werkzeug==0.9.6
requests==2.3.0
gunicorn==18.0

// and then you can install the above mentioned set of dependencies with pip as a batch install
pip3 install -r requirements.txt
