from poet.etl import SPARK

ingest_path = "poet/resource/citibike.csv"
input_df = SPARK.read.format("org.apache.spark.csv").option("header", True).csv(ingest_path)

input_df.show()