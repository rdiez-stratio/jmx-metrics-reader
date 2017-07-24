# jmx-metrics-reader

This image is designed to read jmx metrics.

Configurartion parameters:

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
