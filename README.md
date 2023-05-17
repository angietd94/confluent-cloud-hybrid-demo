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


CLOUD_KEY="*****"<br>
CLOUD_SECRET="*****"<br>

![Cloud Api Key](img/cloudapikeys.png)<br>


ORG_ID="***-***-***-***-****"<br>

ENVID="env-****"<br>
![ENVID](img/env.png)<br>


export CLUSTERID="lkc-***"<br>

#Either us, eu<br>
export GEO="eu"<br>
export REGION="eu-central-1"<br>
<br>
CLUSTERAPIKEY="*****"<br>
CLUSTERAPISECRET="******"<br>
![ENVID](img/clusterapikeys.png)<br>

<br>
#for example, aws or gcp<br>
CLOUDPROVIDER="aws"<br>
<br>
SR_API_KEY="****"<br>
SR_API_SECRET="****"<br>
SCHEMA_REGISTRY_URL="****+"<br>
The URL in the down-right side!
<br>
![ENVID](img/sr.png)<br>
<br>

<br>
BOOTSTRAP_SERVERS="*****:****"<br>



## CLICKHOUSE DATA

export TOPIC="*****" <br>
export DATABASE_NAME="default"<br>
export DATABASE_PASSWORD="*****"<br>
export DATABASE_HOSTNAME="******"<br>
export CLICKHOUSE_HOSTNAME="****"<br>
![ENVID](img/hostname.png)


And the outcome would look like this!
![ENVID](img/outcome.png)


