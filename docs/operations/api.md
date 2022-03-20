# API
Iris is meant to be plug-able to fit and integrates with the existing environments.   

Through the REST API, one can do almost as much as it is possible to do through the web interface.  

## API Keys

The first step is to obtain an API key. Each user is automatically attributed an API token.  
It can be found on the left panel, under username and My Settings. 

![Access Token](../_static/token_access.png)

!!! caution "Token exposure"
    In case the token is exposed and needs to be change, a new one can be generated with the `Renew` option.
    Renewing a token revokes the previous. 



## References

- [API v1.0.0](../_static/iris_api_reference_v1.0.0.html) (applies to Iris <= v1.2.1)
- [API v1.0.1](../_static/iris_api_reference_v1.0.1.html) (applies to Iris > v1.2.1) 
- [API v1.0.2](../_static/iris_api_reference_v1.0.2.html) (applies to Iris > v1.4.0)


## How to use 
The API token is a Bearer and needs to be present in the header `Authorization` when issuing requests. 
For example, to list all the cases: 

```bash

   curl --request GET \
  --url http://localhost:8000/manage/cases/list \
  --header 'Authorization: Bearer mWpCUVNzBMU5EnbIAK50jLPhYjKBTHZjobdogc_n_yixpJTmt9tzAf8WYDI7m5XgB9wCJnlaXlHIh9RZjtp2fA' \
  --header 'Content-Type: application/json'
```

The only way to revoke a token is to renew the current one. Once done, the previous API token does not exist anymore
on the database and it becomes ineffective. 

A Python client is available [here](https://github.com/dfir-iris/iris-client) to ease the automation.  