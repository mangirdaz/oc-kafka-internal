# Builds a docker image running Apache Zookeeper. Intended for use with Kafka.
#
# Usage:
#   docker build -t confluent/zookeeper zookeeper
#   docker run -d --name zookeeper confluent/zookeeper

FROM confluent/platform

MAINTAINER contact@confluent.io

ENV LOG_DIR "/var/log/zookeeper"
ENV ZK_DATA_DIR "/var/log/zookeeper"
ENV KAFKA_LOG4J_OPTS -Dlog4j.configuration=file:/etc/kafka/log4j.properties

ADD zk-docker.sh /usr/local/bin/
ADD log4j.properties /etc/kafka/log4j.properties

RUN ["mkdir", "-p", "/var/log/zookeeper", "/var/lib/zookeeper"]
### CHANGED: to conform with SELinux requirements (enforced by OpenShift)
RUN ["chown", "-R", "confluent", "/var/log/zookeeper", "/var/lib/zookeeper", "/etc/kafka/zookeeper.properties"]
RUN ["chmod", "+x", "/usr/local/bin/zk-docker.sh"]
### ADDED: to conform with SELinux requirements (enforced by OpenShift)
RUN ["chmod", "-R", "a=u", "/var/log/zookeeper", "/var/lib/zookeeper", "/etc/kafka/zookeeper.properties"]

RUN curl -Lo /usr/share/java/kafka/jolokia.jar http://search.maven.org/remotecontent?filepath=org/jolokia/jolokia-jvm/1.3.6/jolokia-jvm-1.3.6-agent.jar
### ADDED: to expose port 8778 for Jolokia
ENV KAFKA_OPTS -javaagent:/usr/share/java/kafka/jolokia.jar=port=8778,protocol=http,extraClientCheck=true,host=0.0.0.0,discoveryEnabled=false

VOLUME ["/var/log/zookeeper", "/var/lib/zookeeper"]

#TODO Expose JMX
### CHANGED: additionally expose port 8778
# Expose client port (2188/tcp), peer connection port (2888/tcp), leader election port (3888/tcp), jolokia port (8778/tcp)
EXPOSE 2181 2888 3888 8778

USER confluent
ENTRYPOINT ["/usr/local/bin/zk-docker.sh"]
