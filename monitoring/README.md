# OpenShift Setup for creating config map for Kafka-Metrics

kafkanetes-configmap-jolokia.yaml is a configuraiton map for exporting Kafka metrics (collected from JMX via Jolokia) which will ultimately be accessible through Grafana.
The config map needs to be created first and is then mounted into each Kafka POD.