# ------------------------------------- #
#
# Test the finished devops pipeline 
#
# ------------------------------------- #

:'
The complete CI/CD pipeline is now configured. Test it from end to end.

In the Cloud console, go to Kubernetes Engine > Services & Ingress.
There should be a single service called hello-cloudbuild in the list. It has been created by the continuous 
delivery build that just ran.

Click on the endpoint for the hello-cloudbuild service. You should see "Hello World!". If there is 
no endpoint, or if you see a load balancer error, you may have to wait a few minutes for the load 
balancer to be completely initialized. Click Refresh to update the page if needed.
'

# In Cloud Shell, replace "Hello World" with "Hello Cloud Build", both in the application 
# and in the unit test:

cd ~/hello-cloudbuild-app

sed -i 's/Hello World/Hello Cloud Build/g' app.py

sed -i 's/Hello World/Hello Cloud Build/g' test_app.py

# Commit and push the change to Cloud Source Repositories:

git add app.py test_app.py

git commit -m "Hello Cloud Build"

git push google master

# After a few minutes, reload the application in your browser. You should now see "Hello Cloud Build!".


