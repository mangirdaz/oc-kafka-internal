# OpenShift Setup for Kafka

Original sources were used and modified:
  Dockerfile         (changed)    -> https://github.com/confluentinc/docker-images/blob/master/kafka/Dockerfile
  kafka-docker.sh    (unchanged)  -> https://github.com/confluentinc/docker-images/blob/master/kafka/kafka-docker.sh 
  server.properties  (unchanged)  -> https://github.com/confluentinc/docker-images/blob/master/kafka/server.properties

Dockerfile is the container description for building the Kafka Docker container.

kafka-docker.sh is the launch script (disabled in Dockerfile but may be used in the future).

server.properties contains the kafka broker configuration and various default values (e.g. topic replication).

kafka-deployment.yaml was created from scratch and contains the OpenShift TEMPLATE for deploying Kafka instances.
The template asks for several parameters and ultimately creates a single Kafka instance. - For a full-blown Kafka cluster, the template needs to be invoked multiple times.
