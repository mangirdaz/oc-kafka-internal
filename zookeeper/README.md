# OpenShift Setup for Zookeeper

Zookeeper is a distributed Key/Value store (very similar to etcd, but older!) which is used by the Kafka message brokers for coordination across the cluster.
Kafka stores meta-data in Zookeeper, such as available topics/partitions and leadership for each topic.

Original sources were used and modified:

  Dockerfile           (changed)    -> https://github.com/confluentinc/docker-images/blob/master/zookeeper/Dockerfile
  
  log4j.properties     (unchanged)  -> https://github.com/confluentinc/docker-images/blob/master/zookeeper/log4j.properties
  
  zk-docker.sh         (unchanged)  -> https://github.com/confluentinc/docker-images/blob/master/zookeeper/zk-docker.sh
  
  zookeeper.properties (changed)    -> extracted from Confluent Zookeeper container https://github.com/confluentinc/docker-images/blob/master/zookeeper/Dockerfile
  

Dockerfile is the container description for building the Zookeeper Docker container.

zk-docker.sh is the launch script launched in the Docker container.

log4j.properties contains the logging configuration.

zookeeper.properties is a configuration file for Zookeeper adapted to the 3-node Zookeeper cluster as an INT and PROD stages.

zookeeper-deployment.yaml was created from scratch and contains the OpenShift TEMPLATE for deploying Zookeeper instances.
The template asks for several parameters and ultimately creates a single Zookeeper instance. - For a full-blown Zookeeper cluster, the template needs to be invoked multiple times (3 times for INT).
