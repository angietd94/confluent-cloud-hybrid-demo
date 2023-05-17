#!/bin/sh


###DOCUMENT BY ANGELICA TACCA DUGHETTI
##### CONFLUENT


# if this file doesnt work remember to #chmod +x executable.sh  !!!!!

######################### USEFUL DOCUMENTATION ##############################

# https://www.confluent.io/hub/clickhouse/clickhouse-kafka-connect?fbclid=IwAR1eDEFO-Q0j7vqu5hXJxoYjRTy6yryHbZrJ0cSUKXJn1NUzkX3NHRualWk
# the guide https://developer.confluent.io/learn-kafka/kafka-connect/self-managed-connect-hands-on/
# learn kafka courses git https://github.com/confluentinc/learn-kafka-courses/blob/main/kafka-connect-101/docker-compose.yml
#cccloud library https://github.com/confluentinc/examples/blob/72922b97dfea80a6e002d558a1539c10cbb1801c/utils/ccloud_library.sh
#youtube video
#https://developer.confluent.io/learn-kafka/kafka-connect/self-managed-connect-hands-on/



#install CLI

export PATH=$(pwd)/bin:$PATH
curl -sL --http1.1 https://cnfl.io/cli | sh -s -- latest

brew install jq

## IMPORT VARIABLES:
source config.sh
chmod +x config.sh
chmod +x config_files.sh 
./config.sh
######If Docker is not installed install it
#Make sure Docker is open
open -a Docker



confluent logout
confluent login --organization-id $ORG_ID --save



#curl -sS -o ccloud_library.sh https://raw.githubusercontent.com/confluentinc/examples/latest/utils/ccloud_library.sh
chmod +x ccloud_library.sh


####### STARTING CONFLUENT PART, CONNECTING TO CLOUD

confluent environment list
confluent environment use $ENVID




###Schema Registry Setup

confluent kafka cluster list
confluent kafka cluster use $CLUSTERID
confluent schema-registry cluster enable --cloud $CLOUDPROVIDER --geo $GEO > temp.txt
SCHEMA_REGISTRY_ID=$(grep '| ID           |' temp.txt | cut -d '|' -f3 | tr -d '[:space:]')
SCHEMA_REGISTRY_URL=$(grep "| Endpoint URL |" temp.txt | awk -F'|' '{print $3}' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
echo $SCHEMA_REGISTRY_ID
echo $SCHEMA_REGISTRY_URL
rm temp.txt


confluent api-key list --current-user





confluent api-key store $CLUSTERAPIKEY $CLUSTERAPISECRET --resource $CLUSTERID
confluent api-key use $CLUSTERAPIKEY --resource $CLUSTERID
confluent kafka cluster use $CLUSTERID
confluent kafka client-config create java --schema-registry-api-key $SR_API_KEY --schema-registry-api-secret $SR_API_SECRET > java.config


ccloud::generate_configs java.config

source java.config
source delta_configs/env.delta
cat delta_configs/env.delta



#Each topic requires a dedicated target table in ClickHouse. The target table name must match the source topic name.

#cat java.config
sleep 3s
#printenv



## LAUNCHING DOCKER-COMPOSE.yml

docker-compose up -d
sleep 10s


#RUNNING THE CONNECT WORKER
docker-compose -f docker-compose.connect.standalone.yml up -d

sleep 10s

docker-compose ps



sleep 30s


#docker-compose -f docker-compose.connect.standalone.yml docker-compose.yml up -d



# Verify that the connectors are correcly there:
curl -s localhost:8083/connector-plugins | jq '.[].class'  

#I SHOULD SEE THE CONSUMERS IN THE CLUSTER NOW in confluent.cloud
####

#IF EVERYTHING IS GOOD THEN

#./config.sh 



#open https://confluent.cloud/environments/$ENVID/clusters/$CLUSTERID/clients/producers

### CLEANING

#echo "Press ENTER to continue and delete everything"
#read
#confluent api-key delete $CLUSTERAPIKEY
#confluent api-key delete $SR_API_KEY
#echo $CLUSTERNAME | confluent kafka cluster delete $CLUSTERID
#confluent kafka cluster list

#CREATE CLICKHOUSE TABLE
#CREATE OR REPLACE TABLE pageviews
#(
#   viewtime UInt64,
#   userid String,
#   pageid String
#)
#ORDER BY userid;


### TO FORCE CLEANING





#### from https://kafka.apache.org/documentation/#basic_ops_consumer_group
#./bin/kafka-consumer-groups --bootstrap-server $BOOTSTRAP_SERVERS --topic "pageviews" --delete --group "connector-consumer-clickhouse-sink-0"


#io.confluent.connect.avro.AvroConverter