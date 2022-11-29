:'
We have a few different applications running on this system. The list of applications are stored at /tmp/assets/apps.txt file. Each application has it's logs stored in /var/log/apps directory under a file with its name. Check it out!

A simple version of the script has been developed for you /home/bob/count-requests.sh that inspects the log file of an application and prints the number of GET, POST, and DELETE requests. Update the script to use a for loop to read the list of applications from the apps.txt file and count number of requests for each application and display it in a tabular format like this.

Log name GET POST DELETE

- - - - - - - - - - - - - - - - - - - - - - - - - - -

Finance 10 20 50

Marketing 20 10 30
'

echo -e " Log name   \t      GET      \t      POST    \t   DELETE "
echo -e "------------------------------------------------------------"

for app in $(cat /tmp/assets/apps.txt)
do
  get_requests=$(cat /var/log/apps/${app}_app.log | grep "GET" | wc -l)
  post_requests=$(cat /var/log/apps/${app}_app.log | grep "POST" | wc -l)
  delete_requests=$(cat /var/log/apps/${app}_app.log | grep "DELETE" | wc -l)
  echo -e " ${app}    \t ${get_requests}    \t    ${post_requests}   \t   ${delete_requests}"

done
