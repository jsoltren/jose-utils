#!/bin/bash

export SPARK_PREPEND_CLASSES=true

# Recall: local-cluster [nodes, cores, memory]
# Recall that the unit for spark.blacklist.timeout is milliseconds.

./bin/spark-shell \
  --master local-cluster[4,4,1024] \
  --conf spark.blacklist.enabled=TRUE \
  --conf spark.blacklist.timeout=1000000 \
  --conf spark.blacklist.application.maxFailedTasksPerExecutor=1 \
  --conf spark.blacklist.application.maxFailedExecutorsPerNode=3 \
  --conf spark.blacklist.stage.maxFailedTasksPerExecutor=3 \
  --conf spark.blacklist.stage.maxFailedExecutorsPerNode=3 \
  --conf spark.blacklist.task.maxTaskAttemptsPerExecutor=3 \
  --conf spark.blacklist.task.maxTaskAttemptsPerNode=3 \
  --conf spark.task.maxFailures=4 \
  --conf spark.eventLog.enabled=TRUE \
  --conf spark.eventLog.compress=FALSE \
  --conf spark.eventLog.overwrite=TRUE \
  --conf spark.eventLog.dir=/Users/jose/logs \
  -i ~/dev/jose-utils/blacklist/test-blacklist.scala

# Options.
# Test executor and not node blacklisting.
#  --conf spark.blacklist.application.maxFailedExecutorsPerNode=3 \
# Test node blacklisting.
#  --conf spark.blacklist.application.maxFailedExecutorsPerNode=2 \


