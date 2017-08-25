#!/bin/bash -xe
#Copyright (c) 2017. Stratio Big Data Inc., Sucursal en España. All rights reserved.

#This software – including all its source code – contains proprietary information of Stratio Big Data Inc., Sucursal en
#España and may not be revealed, sold, transferred, modified, distributed or otherwise made available, licensed or
#sublicensed to third parties; nor reverse engineered, disassembled or decompiled, without express written
#authorization from Stratio Big Data Inc., Sucursal en España.

if [[ -z "$INFLUX_URL" ]]; then
	FILE=jvm_file.json
	if [[ ! -z "$PATH_TO_JVM_JSON" ]]; then
		if [[ ! -f $PATH_TO_JVM_JSON ]]; then
			echo "JVM json file does not exist: $PATH_TO_JVM_JSON"
			exit 1
		fi
		FILE=$PATH_TO_JVM_JSON
	fi
	JMXTRANS_OPTS="-Dport1=$PORT -Durl1=$URL" JAR_FILE=jmxtrans-259-all.jar ./jmxtrans.sh start $FILE > /var/log/jmx_metrics_reader.log
else
	FILE=jvm_influx.json
	if [[ ! -z "$PATH_TO_JVM_JSON" ]]; then
                if [[ ! -f $PATH_TO_JVM_JSON ]]; then
                        echo "JVM json file does not exist: $PATH_TO_JVM_JSON"
                        exit 1
                fi
                FILE=$PATH_TO_JVM_JSON
        fi
	JMXTRANS_OPTS="-Dport1=$PORT -Durl1=$URL -DinfluxUrl=$INFLUX_URL -DinfluxDb=$INFLUX_DB -DinfluxUser=$INFLUX_USER -DinfluxPwd=$INFLUX_PWD" JAR_FILE=jmxtrans-259-all.jar ./jmxtrans.sh start $FILE > /var/log/jmx_metrics_reader.log
fi

tail -f /var/log/jmx_metrics_reader.log
