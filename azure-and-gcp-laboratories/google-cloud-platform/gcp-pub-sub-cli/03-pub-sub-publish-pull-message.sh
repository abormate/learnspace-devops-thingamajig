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

# Use the following command to pull the messages you just published from the Pub/Sub topic
gcloud pubsub subscriptions pull mySubscription --auto-ack

# Important notice about the Pull command for Pub/Sub
: '
What's going on here? You published 4 messages to your topic, but only 1 was outputted
'

: '
Now is an important time to note a couple features of the pull command that often trip developers up:

-- -- Using the pull command without any flags will output only one message, even if you are subscribed to a topic 
that has more held in it.

-- -- Once an individual message has been outputted from a particular subscription-based pull command, you cannot 
access that message again with the pull command.

'