#!/bin/bash

set -euo pipefail

zip -r ./dist/poet.zip poet

poetry build

jobName=$(echo "${JOB}" | awk '{ print tolower($1) }')

if [[ "${jobName}" == "citibike_ingest" ]]; then
    JOB_ENTRY_POINT="poet/etl/test_poet.py"
    INPUT_FILE_PATH="./poet/resource/citibike.csv"
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
    --py-files dist/poet-1-py3-none-any.whl \
    $JOB_ENTRY_POINT \
    $INPUT_FILE_PATH \
    $OUTPUT_PATH

