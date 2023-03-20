# ------------------------------------ #
#
# Pub/Sub publishing and pulling a message
#
# ------------------------------------ #

# Learn

# Publish the message "hello" to the topic you created previously, "myTopic"
gcloud pubsub topics publish myTopic --message "Hello"

# Publish a few more messages. Replace <your name> with your name and <food> with a food you like:
gcloud pubsub topics publish myTopic --message "Publisher's name is <YOUR NAME>"

gcloud pubsub topics publish myTopic --message "Publisher likes the <FOOD>"

gcloud pubsub topics publish myTopic --message "Publisher thinks Pub/Sub is awesome"

: '
Next, use the pull command to get the messages from your topic. The pull command is subscription based, 
meaning it should work because earlier you set up the subscription mySubscription to the topic myTopic
'



