# OpenShift Setup for HA-Proxy router

Original sources were used and modified:

  haproxy-config.template    changed)  -> https://github.com/openshift/origin/blob/master/images/router/haproxy/conf/haproxy-config.template
  
haproxy-config.template is a configuration map for the OpenShift routers (are based on HAProxy).
The config map opens the port 9093 and adds SNI-based routing capabilities (for TLS connections).

More infos on how to configure OpenShift routers is available here:

https://docs.openshift.com/container-platform/3.3/install_config/router/customized_haproxy_router.html

