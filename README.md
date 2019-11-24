
# Hadoop Docker

### Install Docker (Linux Ubuntu):

```shell
$ sudo apt-get remove docker docker-engine docker.io
$ sudo apt-get update
$ sudo apt-get install apt-transport-https ca-certificates  curl software-properties-common
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
$ sudo apt-key fingerprint 0EBFCD88
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
$ sudo apt-get update
$ sudo apt-get install docker-ce
$ sudo docker run hello-world
```

### Install Docker Compose

```shell
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose
```


### Build images
```shell
$ docker-compose build --parallel
```

### Up containers
```shell
$ docker-compose up -d
```


# Applications

Hadoop  	 - http://localhost:9870
		
Cluster:  	 - http://localhost:8088 

HDFS    	 - hdfs://localhost:9000

WEBHDFS 	 - http://localhost:14000/webhdfs/v1

Hive Server2 - http://localhost:10000
	
Hue - http://localhost:8888  
	Username: hue
	Password: secret

# Tutorials

### Enter a Namenode container
```shell
docker exec -it node-master bash
```

## HDFS

### List root content
```shell
hadoop fs -ls /
```
### Create a directory structure
```shell
hadoop fs -mkdir /dados
hadoop fs -ls /
hadoop fs -ls /dados
hadoop fs -mkdir /dados/bigdata
hadoop fs -ls /dados
```

### Test the deletion of a directory
```shell
hadoop fs -rm -r /dados/bigdata
hadoop fs -ls /dados
```

### Add an external file to the cluster
```shell
cd /root
ls
hadoop fs -mkdir /dados/bigdata
hadoop fs -put /var/log/alternatives.log /dados/bigdata
hadoop fs -ls /dados/bigdata
```

### Copy files
```shell
hadoop fs -ls /dados/bigdata
hadoop fs -cp /dados/bigdata/alternatives.log /dados/bigdata/alternatives2.log
hadoop fs -ls /dados/bigdata
```

### List the contents of a file
```shell
hadoop fs -ls /dados/bigdata
hadoop fs -cat /dados/bigdata/alternatives.log
```
### Create a HUE User
```shell
hadoop fs -mkdir /user/hue
hadoop fs -ls /user/hue
hadoop fs -chmod 777 /user/hue
```

## Hive

### Run Hive Shell
```shell
hive
```

### List databases
```shell
> show databases;
```

### Access 'default' Database
```shell
> use default;
```

### List database tables
```shell
> show tables;
```