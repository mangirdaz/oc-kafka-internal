
oc create secret generic kafka-broker-1-tls --from-file=broker-1.keystore.jks --from-file=broker-1.truststore.jks
oc create secret generic kafka-broker-2-tls --from-file=broker-2.keystore.jks --from-file=broker-2.truststore.jks
oc create secret generic kafka-broker-3-tls --from-file=broker-3.keystore.jks --from-file=broker-3.truststore.jks
