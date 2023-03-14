# ------------------------------------ #
#
# View Logs - to check if function worked
#
# ------------------------------------ #

# Check the logs to see your messages in the log history:
gcloud functions logs read helloWorld

# If the function executed successfully, the messsages in the log will appear as follows:
LEVEL  NAME        EXECUTION_ID  TIME_UTC                 LOG
D      helloWorld  3zmhpf7l6j5b  2017-12-05 22:17:42.585  Function execution started
I      helloWorld  3zmhpf7l6j5b  2017-12-05 22:17:42.650  My Cloud Function: Hello World!
D      helloWorld  3zmhpf7l6j5b  2017-12-05 22:17:42.666  Function execution took 81 ms, finished with status: 'ok'

# Note: The logs will take around 10 mins to appear. Also, the alternative way to view the logs is, 
# go to Logging > Logs Explorer.