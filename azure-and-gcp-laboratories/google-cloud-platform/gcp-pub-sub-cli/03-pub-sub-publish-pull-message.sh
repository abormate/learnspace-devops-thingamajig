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

