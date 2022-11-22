: '
In app01 server ensure that our app in /opt/simple-webapp-flask/ run on port 5000 and listen to 127.0.0.1 IP.

Run python app in background with nohup.

Note:- Nohup stands for no hang up, which can be executed as shown below:-

nohup command-with-options &

Adding & at the end will move the process to run in background. When you execute a Unix job in the background (using &) and logout from the session, your process will get killed. You can avoid this with nohup.
'

# step 1
sudo sed -i 's/0.0.0.0/127.0.0.1/g;s/8080/5000/g' /opt/simple-webapp-flask/app.py

# step 2
cat /opt/simple-webapp-flask/app.py

# step 3 -- run in the background
nohup python app.py &

# step 4 -- verify its running
curl http://127.0.0.1:5000
