# ------------------------------------ #
#
# Pub/Sub pull all messages from subscriptions
#
# ------------------------------------ #

# Learn 

# Since you pulled all of the messages from your topic in the last example step, 
# populate myTopic with a few more messages

gcloud pubsub topics publish myTopic --message "Publisher is starting to get the hang of Pub/Sub"

gcloud pubsub topics publish myTopic --message "Publisher wonders if all messages will be pulled"

gcloud pubsub topics publish myTopic --message "Publisher will have to test to find out"