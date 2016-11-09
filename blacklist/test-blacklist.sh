#!/bin/bash

export SPARK_PREPEND_CLASSES=true

./bin/spark-shell \
  --master local-cluster[2,2,1024] \
  --conf spark.blacklist.enabled=TRUE \
  -i ~/test-blacklist.scala


#  --conf spark.blacklist.task.maxTaskAttemptsPerExecutor=1 \
#  --conf spark.blacklist.task.maxTaskAttemptsPerNode=1 \
#  --conf spark.blacklist.application.maxFailedTasksPerExecutor=1 \
#  --conf spark.blacklist.stage.maxFailedTasksPerExecutor=1 \
#  --conf spark.blacklist.application.maxFailedExecutorsPerNode=1 \
#  --conf spark.blacklist.stage.maxFailedExecutorsPerNode=1 \
#  --conf spark.blacklist.timeout=999999999 \
