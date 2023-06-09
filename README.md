# confluent-cloud-hybrid-demo
<br>
Detailed video of every step here:<br>
----> 

https://drive.google.com/file/d/1MQC5X1bzX7G6sivb77Nao2t7I-O15nA8/view?usp=sharing

<br>
First clone the git repo, and enter in the folder:

```
git clone https://github.com/angietd94/confluent-cloud-hybrid-demo.git
cd confluent-cloud-hybrid-demo

```

## Modify first the config.sh file with your values! If done, skip this part. <br>


###Guide: to find values in Confluent Cloud:


CLOUD_KEY="*****"<br>
CLOUD_SECRET="*****"<br>

![Cloud Api Key](img/cloudapikeys.png)<br>


ORG_ID="***-***-***-***-****"<br>
![IMAGE_DESCRIPTION](img/org.png)<br>

ENVID="env-****"<br>
![IMAGE_DESCRIPTION](img/env.png)<br>


export CLUSTERID="lkc-***"<br>
insidde the cluster information . Cluster > Cluster Settings.

#Either us, eu<br>
export GEO="eu"<br>
export REGION="eu-central-1"<br>
<br>
CLUSTERAPIKEY="*****"<br>
CLUSTERAPISECRET="******"<br>
![IMAGE_DESCRIPTION](img/clusterapikeys.png)<br>
<br>
<br>
#for example, aws or gcp<br>
CLOUDPROVIDER="aws"<br>
<br>
SR_API_KEY="****"<br>
SR_API_SECRET="****"<br>
SCHEMA_REGISTRY_URL="****+"<br>
The URL in the down-right side!
<br>
![IMAGE_DESCRIPTION](img/sr.png)<br>
<br>


<br>
BOOTSTRAP_SERVERS="*****:****"<br>
![IMAGE_DESCRIPTION](img/bootstrap.png)<br>

<br>
<br>



## CLICKHOUSE DATA

export TOPIC="*****" <br>
export DATABASE_NAME="default"<br>
export DATABASE_PASSWORD="*****"<br>
export DATABASE_HOSTNAME="******"<br>
export CLICKHOUSE_HOSTNAME="****"<br>
![IMAGE_DESCRIPTION](img/hostname.png)



############
##  Second part: Launching the script! <br>


then: <br>
```
chmod +x executable.sh 
chmod +x config_files.sh
chmod +x config.sh
chmod +x ccloud-generate-cp-configs.sh
./executable.sh

```
More information on the part of Auto generating: <br>
Example: Autogenerate Self-Managed Component Configs for Confluent Cloud  <br>
https://docs.confluent.io/cloud/current/cp-component/auto-generate-configs.html
<br>
Can you see the Control center here?
<br>
http://localhost:9021/clusters
<br>

and the plugins here? 
<br>

http://localhost:8083/connector-plugins
<br>
What I see:
<br>
![IMAGE_DESCRIPTION](img/outcome.png)


<br>
<br>


if YES!

CREATE A TOPIC , I called it simple_example_avro for example with a simple schema: <br>
```
{
  "doc": "Sample schema to help you get started.",
  "fields": [
    {
      "name": "age",
      "type": "int"
    },
    {
      "doc": "The string is a unicode character sequence.",
      "name": "name",
      "type": "string"
    }
  ],
  "name": "sampleRecord",
  "namespace": "com.mycorp.mynamespace",
  "type": "record"
}
```

<br>

and then after this launch config_files.sh making sure all values are good (they should)
This will add a connector for clickhouse

```
./config_file.sh
```

You can verify it here, or in the control center!
<br>
http://localhost:8083/connectors/
<br>


CREATE A TABLE IN CLICKHOUSE SIMILAR TO THE STRUCTURE OF YOUR TOPIC <br>
for example:

```
CREATE OR REPLACE TABLE simple_example_avro
(
    age Int64,
    name String
)
ENGINE = MergeTree
ORDER BY name;
```

Try send messages in CC something lik: <br>
```
{
	"name": "angelica",
	"orderid": 29
}
```
And the outcome would look like this!
![IMAGE_DESCRIPTION](img/lastpart.png)


Also some videos here that go through all the process:
https://drive.google.com/file/d/1xUpOMX-cFQDH5BVCfKHOc4IMn8uYmNxV/view
https://drive.google.com/file/d/1Zr-Nkpmpd2leGuErGQRAPJWxmiheWZTB/view?usp=sharing

