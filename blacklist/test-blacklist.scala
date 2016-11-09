import org.apache.spark.SparkEnv
sc.setLogLevel("INFO")

sc.parallelize(1 to 1000).map{ x => if (SparkEnv.get.executorId.toInt % 2 == 0) throw new RuntimeException("bad exec") else x}.count()
