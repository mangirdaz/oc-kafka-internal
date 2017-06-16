
oc create configmap zk-config --from-file=zookeeper.properties
oc create configmap hawkular-openshift-agent-zookeeper-1 --from-file=hawkular-openshift-agent-zookeeper-1-configmap.yaml
oc create configmap hawkular-openshift-agent-zookeeper-2 --from-file=hawkular-openshift-agent-zookeeper-2-configmap.yaml
oc create configmap hawkular-openshift-agent-zookeeper-3 --from-file=hawkular-openshift-agent-zookeeper-3-configmap.yaml
