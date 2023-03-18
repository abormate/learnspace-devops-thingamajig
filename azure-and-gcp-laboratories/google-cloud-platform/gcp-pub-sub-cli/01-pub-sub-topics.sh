# ----------------------------------- #
#
# Pub/Sub topics
#
# ----------------------------------- #

# Learn 
# Setting up

: '
Google Cloud Pub/Sub is a messaging service for exchanging event data among applications and services. 
By decoupling senders and receivers, it allows for secure and highly available communication between 
independently written applications. Google Cloud Pub/Sub delivers low-latency/durable messaging, and 
is commonly used by developers in implementing asynchronous workflows, distributing event notifications, 
and streaming data from various processes or devices

'

# activate Cloud Shell
# list active account name
gcloud auth list

# authorize

# list project ID with the following
gcloud config list project

: '
As stated earlier, Google Cloud Pub/Sub is an asynchronous global messaging service. There are three terms in 
Pub/Sub that appear often: topics, publishing, and subscribing.

A topic is a shared string that allows applications to connect with one another through a common thread.

Publishers push (or publish) a message to a Cloud Pub/Sub topic.

Subscribers make a "subscription" to a topic where they will either pull messages from the subscription or 
configure webhooks for push subscriptions. Every subscriber must acknowledge each message within a configurable 
window of time.

To sum it up, a producer publishes messages to a topic and a consumer creates a subscription to a topic to 
receive messages from it.

'

# Pub/Sub comes pre-installed in Cloud Shell, so there are no installations or configurations required to
# get started with this service.

# create a pub/sub topic called "myTopic"
gcloud pubsub topics create myTopic

# For good measure, create 2 more topics -- one called "Test1" another called "Test2"
gcloud pubsub topics create Test1

gcloud pubsub topics create Test2

# To see the 3 topics you just created, run the following:
gcloud pubsub topics list

# output should be the following

name: projects/projectID-gcp-3450558d2b043890/topics/myTopic
---
name: projects/projectID-gcp-3450558d2b043890/topics/Test2
---
name: projects/projectID-gcp-3450558d2b043890/topics/Test1



