#!/bin/bash

set -euo pipefail

poetry build

jobName=$(echo "${JOB}" | awk '{ print tolower($1) }')

if [[ "${jobName}" == "citibike_ingest" ]]; then
    INPUT_FILE_PATH="./poet/resource/citibike.csv"
    JOB_ENTRY_POINT="poet/etl/test_poet.py"
    OUTPUT_PATH="./output_int"
else
  echo "Job name provided was : ${JOB} : failed"
  echo "Job name deduced was : ${jobName} : failed"
  echo "Please enter a valid job name (citibike_ingest, citibike_distance_calculation or wordcount)"
  exit 1
fi

rm -rf $OUTPUT_PATH

poetry run spark-submit \
    --master local \
    --py-files dist/data_transformations-*.whl \
    $JOB_ENTRY_POINT \
    $INPUT_FILE_PATH \
    $OUTPUT_PATH

