# API
IRIS is designed to be flexible and can easily integrate with existing environments through its extensive REST API. With the REST API, you can perform almost all tasks that are possible using the web interface. In fact, the web interface itself communicates with the API for various operations. 

The API endpoints are accessible via the same port as the web interface by default, which is 443 using HTTPS protocol. This means you can seamlessly interact with IRIS through APIs and web interfaces based on your requirements.  

!!! hint
    A Python client is available [here](https://github.com/dfir-iris/iris-client) to ease the automation.  

## API Keys

The first step is to obtain an API key. Each user is automatically attributed one when it is created.  
It can be found on the left panel, under username and `My Settings`. 

![Access Token](../_static/token_access.png)

!!! caution "Token exposure"
    In case the token is exposed and needs to be changed, a new one can be generated with the `Renew` option.
    Renewing a token revokes the previous. 



## References
The API constantly evolves with IRIS and thus multiple versions exists.  
Use the references below to check which API version applies to your IRIS version.  Starting from IRIS v1.4.0, the supported API version can also be checked in the UI `Advanced` > `Server settings`.


| IRIS Version|	API Version & Reference |
|-------------|---------|
| v1.2.0|	[API v1.0.0](../_static/iris_api_reference_v1.0.0.html) |
| v1.2.1|	[API v1.0.0](../_static/iris_api_reference_v1.0.0.html) |
| v1.3.0|	[API v1.0.1](../_static/iris_api_reference_v1.0.1.html) |
| v1.3.1|	[API v1.0.1](../_static/iris_api_reference_v1.0.1.html) |
| v1.4.0|	[API v1.0.2](../_static/iris_api_reference_v1.0.2.html) |
| v1.4.1|	[API v1.0.2](../_static/iris_api_reference_v1.0.2.html) |
| v1.4.2|	[API v1.0.2](../_static/iris_api_reference_v1.0.2.html) |
| v1.4.3|	[API v1.0.3](../_static/iris_api_reference_v1.0.3.html) |
| v1.4.4|	[API v1.0.3](../_static/iris_api_reference_v1.0.3.html) |
| v1.4.5|	[API v1.0.3](../_static/iris_api_reference_v1.0.3.html) |
| v2.0.x|	[API v2.0.0](../_static/iris_api_reference_v2.0.0.html) |
| v2.1.x|	[API v2.0.1](../_static/iris_api_reference_v2.0.1.html) |
| v2.2.x|	[API v2.0.1](../_static/iris_api_reference_v2.0.1.html) |
| v2.3.x|	[API v2.0.2](../_static/iris_api_reference_v2.0.2.html) |
| v2.4.x|	[API v2.0.4](../_static/iris_api_reference_v2.0.4.html) |
| :octicons-file-code-24: develop|	[API v2.1.0](../_static/iris_api_reference_v2.1.0.html) |


## How to use 
The API token is used as a Bearer and needs to be present in the header `Authorization` when issuing requests. 
For example, to list all the cases: 

```bash
   curl --request GET \
  --url http://<yourserver_ip>/manage/cases/list?cid=1 \
  --header 'Authorization: Bearer mWpCUVNzBMU5EnbIAK50jLPhYjKBTHZjobdogc_n_yixpJTmt9tzAf8WYDI7m5XgB9wCJnlaXlHIh9RZjtp2fA' \
  --header 'Content-Type: application/json'
```

The only way to revoke a token is to renew the current one. Once done, the previous API token does not exist anymore
in the database and it becomes ineffective. 
