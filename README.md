# jmx-metrics-reader

This image is designed to read jmx metrics.

Configuration parameters:

- Reader options:
* URL: Url where to read metrics from.
* PORT: Port where to read metrics from.
* PATH_TO_JVM_JSON: Path inside the docker where jvm json (defining metrix to be read) has been mounted.
  (If not provided we will use one of the default ones provided in the docker image, based on the value of INFLUX_URL)

- Influx options:
* INFLUX_URL: Url of the influx db where to store metrics read.
  (If not provided data will be stored to file)
* INFLUX_DB: Name of the database where to store results.
* INFLUX_USER: User to connect to influx database.
* INFLUX_PWD: Password to connect to influx database.

Example:
- Write results to file:
docker run -dit --name jmx -e PORT=9091 -e URL=10.200.0.58 qa.stratio.com/stratio/jmx-metrics-reader:0.1.0-SNAPSHOT

- Write results to influx:
docker run -dit --name jmx -e PORT=9091 -e URL=10.200.0.58 -e INFLUX_URL=10.200.0.60 -e INFLUX_DB=metrics -e INFLUX_USER= user -e INFLUX_PWD=password qa.stratio.com/stratio/jmx-metrics-reader:0.1.0-SNAPSHOT


- Provide jvm json:
docker run -dit --name jmx -v my_jvm_json_dir:/tmp -e PORT=9091 -e URL=10.200.0.58 -e PATH_TO_JVM_JSON=/tmp/my_jvm.json qa.stratio.com/stratio/jmx-metrics-reader:0.1.0-SNAPSHOT
