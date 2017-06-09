# Maybe not neccessary? kafkabroker is assigned to SCC scc-kafka.
oc adm policy add-scc-to-user hostnetwork system:serviceaccount:common-infrastructure:kafkabroker
 
