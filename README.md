# Gift Distribution

The RESTful API is created for assigning a gift to employees based on their interest

## Features

1) MySql Database
2) API Logs
3) Dockerfile
4) RESTful API
5) PDO
6) .Env File
7) YAML
8) OOPs

## Installation

Download the file and extract them and run the below command in the terminal inside the gifts folder

```bash
docker-compose up --build
```

To check the logs of API's request and response use below command

```bash
docker logs -f php-apache >/dev/null
```

## Logs

There are four types of logs are supported

1. Critical
2. Debug
3. Error
4. Info

Usage

```bash
\Log::info(context, message);
```

## Accessibility

`Url` : http://localhost:8100/

`Method` : POST

`Form-data` : emp_id

for instance

`emp_id : 10`

## Employee Data

   
    emp_id     name
	1	severin
	2	oliver
	3	henry
	4	karsten
	5	mehmet
	6	jan
	7	alex
	8	sarah
	9	daniel
	10	werner
	11	robert
	12	daniel
	13	jonathan
	14	maxim
	15	michel
	16	marc

## Response JSON

The first time gift assignment response with http code is 200

```bash
{
    "status": true,
    "data": {
        "emp_id": 14,
        "name": "maxim",
        "gift_id": 10,
        "gift_name": "goggles"
    },
    "message": "Gift is assigned"
}
```

In case already the gift is assigned

```bash
{
    "status": true,
    "data": {
        "emp_id": 12,
        "name": "daniel",
        "gift_id": 7,
        "gift_name": "dog treats"
    },
    "message": "Gift is already assigned"
}
```

Invalid Employee Id response

```bash
{
    "status": false,
    "data": {},
    "message": "Employee id is not found"
}
```

## REDIS installation inside the php

```bash
composer require predis/predis
```

Initating the Redis client

```bash
require './vendor/autoload.php';
$redis = new Predis\Client();
echo $redis->ping();
```

Set the Redis key and retreive them

```bash
$redis->set('name', 'redis');
$redis->get('name');
```

Set the expiry time to the Redis key

```bash
$redis->expire('name', 10); //seconds 10
```

## REDIS to handle the rate limit for hitting an API

```bash
require './vendor/autoload.php';
$redis = new Predis\Client();
$ip = $_SERVER['REMOTE_ADDR'];
$reqCount = $redis->icr($ip); //it will create a key with increment by 1
if($reqCount == 0) $redis->expiry($ip, 10); // setting expiry as 10 sec
if($reqCount < 6){
    // allow the user to process
}else{
    $ttl = $redis->ttl($ip); //time live the expiry time (means $ttl time let the user to know much time is pending to start the new requests again)
}
```


