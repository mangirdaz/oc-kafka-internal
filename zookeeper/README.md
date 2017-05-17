# OpenShift Setup for Zookeeper

Zookeeper is a distributed Key/Value store (very similar to etcd, but older!) which is used by the Kafka message brokers for coordination across the cluster.
Kafka stores meta-data in Zookeeper, such as available topics/partitions and leadership for each topic.

Original sources were used and modified:
  Dockerfile         (changed)    -> https://github.com/confluentinc/docker-images/blob/master/zookeeper/Dockerfile
  log4j.properties   (unchanged)  -> https://github.com/confluentinc/docker-images/blob/master/zookeeper/log4j.properties
  zk-docker.sh       (unchanged)  -> https://github.com/confluentinc/docker-images/blob/master/zookeeper/zk-docker.sh

Dockerfile is the container description for building the Zookeeper Docker container.

zk-docker.sh is the launch script launched in the Docker container.

log4j.properties contains the logging configuration.
