# ----------------------------------- #
#
# Pub/Sub subscriptions
#
# ----------------------------------- #

# Run the following to create a subscription called "mySubscription" to topic "myTopic"
gcloud  pubsub subscriptions create --topic myTopic mySubscription

# Add another 2 subscriptions to "myTopic". First one is, "Test1" next one is "Test2"
gcloud  pubsub subscriptions create --topic myTopic Test1

gcloud  pubsub subscriptions create --topic myTopic Test2

# Run the following to check the list of subscriptions to myTopic
gcloud pubsub topics list-subscriptions myTopic

# Output should be like:
---
  projects/projectid-gcp-3450558d2b043890/subscriptions/Test2
---
  projects/projectid-gcp-3450558d2b043890/subscriptions/Test1
---
  projects/projectid-gcp-3450558d2b043890/subscriptions/mySubscription

# Delete "Test1" and "Test2" subscriptions.
gcloud pubsub subscriptions delete Test1

gcloud pubsub subscriptions delete Test2

