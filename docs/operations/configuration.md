# Configuration 
The entire configuration is done through the `.env` file at the root of the IRIS directory.  

## Default configuration 
The default configuration is provided through a `.env.model` file at the root of the IRIS directory. One need to copy this file to `.env` and modify it if needed.  

**The default configuration is suitable for testing only.**  See the section below to configure IRIS for production.  

## Production configuration
### Secrets 
#### Required changes
The following secrets in the `.env` need to be changed for production.  
We recommend generating different values for each secret using one of the following commands:

```bash
pwgen -snc1 60
# or
cat /dev/urandom | tr -dc '[:alnum:]' | head -c 60
# or
openssl rand -base64 100 | tr -dc '[:alnum:]' | head -c 60
# or
openssl rand -hex 30
```

- `POSTGRES_PASSWORD`: Password of the postgres user
- `POSTGRES_ADMIN_PASSWORD`: Password of the db admin user 
- `IRIS_SECRET_KEY`: Key used by Flask to secure the session cookies
- `IRIS_SECURITY_PASSWORD_SALT`: A salt used for password encryption in the DB 

Make sure the DB password does not contain any special characters the can be interpreted as part of URLs (e.g., `+`, `/`, `#`, `@`).

!!! danger "Critical configuration"
    These settings are critical and need to be set properly otherwise authentication bypass may occur. 


#### Optional changes 
To automate the provisionning of IRIS, one might need to set the default administrator API token and password. This can be achieve with the following environment variables.   
If those variables are not set, random ones are generated during the very first boot of the application.   

!!! Warning 
    The administrator password is printed in the logs. It is recommended to change it as soon as possible.
    The set of the following environment variables has no effect once the administrator account is created, i.e after the very first boot.

- `IRIS_ADM_PASSWORD`: Password of the administrator account. The password need to match the default password policy or the administrator won't be able to login,  
- `IRIS_ADM_API_KEY`: API key of the administrator. A random long string. No verification for the complexity is done. We recommend using `openssl rand -base64 64`

### Certificates
IRIS is configured to use a self-signed certificate by default. This is suitable for testing only.   
To use your own certificate, you need to set the following environment variables:  

- `KEY_FILENAME`: The filename of the key file in the `certificates/web_certificates` directory at the root of the IRIS directory
- `CERT_FILENAME`: The filename of the certificate file in the `certificates/web_certificates` directory at the root of the IRIS directory

Once the changes are done, nginx docker container need to be rebuilt with the following command:

```bash
docker-compose stop nginx
docker-compose build nginx --no-cache
docker-compose up 
```

### Authentication
#### LDAP
IRIS can be configured to use LDAP authentication. See the [Authentication section](/operations/access_control/authentication/#ldap-authentication) for more details.

## Available settings
These environment variables are availabled to be set.  

| Key | Section | Opt | Description | 
|:-----:|---------|-----|------|
| `SERVER_NAME` | Nginx | No | Passed to the server_name in NGINX configuration | 
| `KEY_FILENAME` | Nginx | No | SSL Cert key filename passed to the NGINX configuration | 
| `CERT_FILENAME` | Nginx | No | SSL Cert filename passed to the NGINX configuration | 
| `INTERFACE_HTTPS_PORT`| Nginx | Yes | Listening interface of IRIS | 
| `POSTGRES_USER` | DB | No | Name of the POSTGRES user | 
| `POSTGRES_PASSWORD` | DB | No | Password of the POSTGRES user | 
| `POSTGRES_ADMIN_USER` | DB | No | Name of the admin user | 
| `POSTGRES_ADMIN_PASSWORD` | DB | No | Password of the ADMIN user | 
| `POSTGRES_DB` | DB | No | Name of the DB used by IRIS | 
| `POSTGRES_SERVER` | DB | No | Hostname or IP of the DB | 
| `POSTGRES_PORT` | DB | No | Port of the DB server | 
| `DOCKERIZED` | IRIS | Yes | Set to `1` when using dockers (default) | 
| `IRIS_SECRET_KEY` | IRIS | No | Secret key used to secure sessions - needs to be random | 
| `IRIS_SECURITY_PASSWORD_SALT` | IRIS | No | Secret used to salt the passwords in DB - needs to be random | 
| `IRIS_UPSTREAM_SERVER` | IRIS | No | WebApp upstream server - used to configure nginx reverse proxy | 
| `IRIS_UPSTREAM_PORT` | IRIS | No | WebApp upstream server port - used to configure nginx reverse proxy | 
| `IRIS_ORGANISATION_NAME`| IRIS | No | Name of the company / organisation. Used on the UI | 
| `IRIS_LOGIN_BANNER_TEXT`| IRIS | No | Text displayed on the login page |
| `IRIS_LOGIN_PTFM_CONTACT`| IRIS | No | Contact information displayed on the login page |
| `IRIS_UPLOADED_PATH` | IRIS | No | Path to store uploaded data. | 
| `IRIS_BACKUP_PATH` | IRIS | No | Path to store backup files. | 
| `IRIS_TEMPLATES_PATH` | IRIS | No | Path of the templates | 
| `IRIS_DATASTORE_PATH` | IRIS | No | Path of the datastore files | 
| `IRIS_DEMO_ENABLED`| Demo | No | Set to True to switch IRIS to Demo mode | 
| `IRIS_DEMO_DOMAIN` | Demo | No | URL of the demonstration server | 
| `IRIS_DEMO_USER_SEED`| Demo | No | Random seed to generate demo users | 
| `IRIS_DEMO_ADM_SEED` | Demo | No | Random seed to generate admin users for demo | 
| `CELERY_BROKER` | Celery | No | Broker URL used to handle IRIS tasks | 
| `IRIS_AUTHENTICATION_TYPE` | Auth | No | IRIS auth mode : `local` or `ldap` | 
| `IRIS_ADM_PASSWORD` | Auth | Yes | Set to use as initial password of the administrator account. Only works for the very first run of IRIS. Needs to match the password policy | 
| `IRIS_ADM_API_KEY` | Auth | Yes | Set to use as initial API Key of the administrator | 
| `IRIS_ADM_EMAIL` | Auth | Yes | Set to use as initial email of the administrator | 
| `IRIS_ADM_USERNAME`| Auth | Yes | Set to use as initial username of the administrator | 
| `LDAP_SERVER`| Auth | Yes | LDAP server IP or domain | 
| `LDAP_PORT`| Auth | Yes| LDAP server port | 
| `LDAP_USER_PREFIX`| Auth | Yes | Prefix to search the users within  | 
| `LDAP_USER_SUFFIX`| Auth | Yes | Suffix to search the users within |
| `LDAP_USE_SSL`| Auth | Yes | Set to True to use LDAPS |
| `LDAP_VALIDATE_CERTIFICATE` | Auth | Yes | Set to True to verify the server certificate validity | 
| `LDAP_TLS_VERSION` | Auth | Yes | TLS version to use LDAPS | 
| `LDAP_SERVER_CERTIFICATE`| Auth | Yes | Path of the LDAP server certificate | 
| `LDAP_PRIVATE_KEY`| Auth | Yes | Path of the LDAP private certificate | 
| `LDAP_PRIVATE_KEY_PASSWORD`| Auth | Yes | Password of the private key | 
| `LDAP_AUTHENTICATION_TYPE`| Auth | Yes | Simple, SASL or NTLM | 
| `LDAP_CUSTOM_TLS_CONFIG`| Auth | Yes | If set to true, the TLS configuration is not set by IRIS and taken from the defined environment. Default to False |
| `OIDC_ISSUER_URL`      | Auth         | Yes | The URL of the OIDC issuers                           |
| `OIDC_CLIENT_ID`       | Auth         | Yes | The unique identifier for your client in the OIDC system  |
| `OIDC_CLIENT_SECRET`   | Auth         | Yes | Your client's secret key for OAuth 2.0 authentication    |
| `OIDC_AUTH_ENDPOINT`   | Auth         | Yes  | The endpoint for initiating the OIDC authentication flow  |
| `OIDC_TOKEN_ENDPOINT`  | Auth         | Yes  | The endpoint to exchange an authorization grant for a token |
| `OIDC_END_SESSION_ENDPOINT` |Auth    |Yes  |The endpoint that tells the OpenID Provider to end the session|
| `OIDC_SCOPES`         | Auth         | Yes| Comma-separated list of scopes for your OIDC application       |
| `OIDC_MAPPING_USERNAME` | Auth         | Yes | The attribute name or mapping for the username in IRIS         |
| `OIDC_MAPPING_EMAIL`   | Auth         | Yes | The attribute name or mapping for email in IRIS              |
