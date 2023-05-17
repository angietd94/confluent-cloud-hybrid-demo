# confluent-cloud-hybrid-demo


Modify first the config.sh file with your values! <br>

then: <br>
```
chmod +x executable.sh <br>
chmod +x config_files.sh<br>
```

Run:
```
./executable.sh <br>
```

It will ask for username and password for the account.
<br>

Check: <br>
http://localhost:8083/connector-plugins <br>
http://localhost:8083/connectors/ 
<br>
http://localhost:9021/clusters/

when all is up, modify first the config_files.sh file with your values for the connector and then run it. <br>
```
./config_files.sh
```
Note: to find values in Confluent Cloud:


CLOUD_KEY="*****"
CLOUD_SECRET="*****"

![Cloud Api Key](img/cloudapikeys.png)


ORG_ID="***-***-***-***-****"
ENVID="env-****"
![ENVID](img/env.png)


export CLUSTERID="lkc-***"

#Either us, eu
export GEO="eu"
export REGION="eu-central-1"

CLUSTERAPIKEY="*****"
CLUSTERAPISECRET="******"

#for example, aws or gcp
CLOUDPROVIDER="aws"

SR_API_KEY="****"
SR_API_SECRET="****"

![ENVID](img/sr.png)



BOOTSTRAP_SERVERS="*****:****"
SCHEMA_REGISTRY_URL="****+"


## CLICKHOUSE DATA

export TOPIC="*****"
export DATABASE_NAME="default"
export DATABASE_PASSWORD="*****"
export DATABASE_HOSTNAME="******"
export CLICKHOUSE_HOSTNAME="****"


And the outcome would look like this!
![ENVID](img/outcome.png)


