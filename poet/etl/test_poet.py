import sys
import pyspark

pyspark.SparkContext.addPyFile("dist/poet-1-py3-none-any.whl")

input_path = sys.argv[1]
output_path = sys.argv[2]
print(input_path)
print(output_path)

from poet.etl import SPARK


# ingest_path = "poet/resource/citibike.csv"
input_df = SPARK.read.format("org.apache.spark.csv").option("header", True).csv(input_path)

input_df.show()