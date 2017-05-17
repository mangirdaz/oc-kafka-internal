# Builds a docker image running Confluent's distribution of Apache Kafka.
# Needs to be linked with a Zookeeper container with alias "zookeeper".
#
# Usage:
#   docker build -t confluent/kafka kafka
#   docker run -d --name kafka --link zookeeper:zookeeper confluent/kafka

FROM confluent/platform

MAINTAINER contact@confluent.io

ENV LOG_DIR "/var/log/kafka"
ENV KAFKA_LOG_DIRS "/var/lib/kafka"

ADD kafka-docker.sh /usr/local/bin/

RUN ["mkdir", "-p", "/var/lib/kafka", "/var/log/kafka", "/etc/security"]
### CHANGED: to conform with SELinux requirements (enforced by OpenShift)
RUN ["chown", "-R", "confluent", "/var/lib/kafka", "/var/log/kafka", "/etc/kafka/server.properties"]
RUN ["chmod", "+x", "/usr/local/bin/kafka-docker.sh"]
### ADDED: to conform with SELinux requirements (enforced by OpenShift)
RUN ["chmod", "-R", "a=u", "/var/lib/kafka", "/var/log/kafka", "/etc/kafka/server.properties"]

VOLUME ["/var/lib/kafka", "/var/log/kafka", "/etc/security"]

### ADDED: Jolokia library for exporting JMX metrics
RUN curl -Lo /usr/share/java/kafka/jolokia.jar http://search.maven.org/remotecontent?filepath=org/jolokia/jolokia-jvm/1.3.6/jolokia-jvm-1.3.6-agent.jar


#TODO Update the ports that are exposed.
#TODO Add support to expose JMX
EXPOSE 9092 9093

USER confluent

### CHANGED: Disabled automated launch of Kafka in container. Instead Kafka is launched by passing additional params to Docker.
#ENTRYPOINT ["/usr/local/bin/kafka-docker.sh"] 