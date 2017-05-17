#!/bin/bash

### CHANGED: access config if configured only (instead of hardcoded config file)
ZK_CFG_FILE="${ZK_CFG_FILE:-/etc/kafka/zookeeper.properties}"

: ${zk_id:=1}
: ${zk_tickTime:=2000}
: ${zk_initLimit:=5}
: ${zk_syncLimit:=2}
: ${zk_clientPort:=2181}
: ${zk_maxClientCnxns:=0}

export zk_dataDir='/var/lib/zookeeper'

export zk_id
export zk_tickTime
export zk_initLimit
export zk_syncLimit
export zk_clientPort
export zk_maxClientCnxns

# Download the config file, if given a URL
if [ ! -z "$ZK_CFG_URL" ]; then
  echo "[zk] Downloading zk config file from ${ZK_CFG_URL}"
  curl --location --silent --insecure --output ${ZK_CFG_FILE} ${ZK_CFG_URL}
  if [ $? -ne 0 ]; then
    echo "[zk] Failed to download ${ZK_CFG_URL} exiting."
    exit 1
  fi
fi

### ADDED: replace all placeholders SERVICE_NAME_PREFIX in the template with $SERVICE_NAME_PREFIX environment variable
if [ ! -z "$ZK_CFG_TEMPLATE" ]; then
  cat ${ZK_CFG_TEMPLATE} | sed \
    -e "s|{{SERVICE_NAME_PREFIX}}|${SERVICE_NAME_PREFIX:-}|g" \
    > ${ZK_CFG_FILE}
fi

# Set Zookeeper ID
echo $zk_id > $zk_dataDir/myid

/usr/bin/docker-edit-properties --preserve-case --file ${ZK_CFG_FILE} --include 'ZK_(.*)' --include 'zk_(.*)' --exclude '^zk_cfg_'

exec /usr/bin/zookeeper-server-start ${ZK_CFG_FILE}