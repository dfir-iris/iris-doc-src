# Authentication 
IRIS supports local, LDAP and OIDC authentication. 

!!! note 
    In all the cases, users need to be declared in IRIS.   

## Local authentication 
Local authentication is the default setting. The password is validated against the local IRIS database.  
Passwords are stored salted and hashed, it is thus not possible to retrieve them in case they are lost. It is however possible to change them.   

### Changing a lost password
**If another administrative user exists** : Being logged as this user, head to the `Advanced` > `Access Control` > `Users` section, and change the administrator password. 

**If no other administrative user exists** : the change cannot be done via IRIS and an access to the backend is needed.  

!!! danger "Danger"
    Do not delete and recreate any users directly from the DB! This will create inconsistencies in the relations and certainly corrupt everything. 

1. Generate the hash of the new password with Python BCrypt in Python prompt
   
    ```python
    import bcrypt
    print(bcrypt.hashpw('<new_password>'.encode('utf-8'), bcrypt.gensalt()))
    ```

2. Connect to the DB docker then the Postgresql database `iris_db` and update the password 

    ```bash
    docker exec -ti <db_docker_id> /bin/bash
    / # su postgres
    / # psql
    postgres=# \c iris_db 
    postgres=# UPDATE "user" SET password = '<hash>' WHERE "user".name = 'administrator';
    postgres=# \q
    exit
    exit
    ```


## LDAP authentication 
LDAP authentication rely on a LDAP server to verify the password of a user.    
**The user needs to be declared in IRIS**.   

```mermaid
graph LR
    A[User] -->|Authenticate| B(IRIS WebApp)
    B --> C{User exists in DB?}
    C -->|Yes| D{LDAP accepted password?}
    C -->|No| E[Authentication failed]
    D -->|Yes| F[Authentication succeeded]
    D -->|No| E[Authentication failed]
```

### Settings 
The LDAP settings are present in the `.env`. Once the LDAP server information is set, reboot the Iris WebApp docker needs to be restarted.  

```bash
docker-compose restart app
```

#### Setting up LDAP for the first runtime of IRIS 
To set up LDAP without having run IRIS priorly, and as the app needs the accounts to be created first before using LDAP, one has to set the `IRIS_ADM_EMAIL` environment with the LDAP Email of the administrator user.  

```bash title="Example of LDAP configuration for first run"
IRIS_AUTHENTICATION_TYPE=ldap

## IP address or FQDN of the ldap server
LDAP_SERVER=dc1.domain.local

## Port of the LDAP server
LDAP_PORT=636

## LDAP Authentication type
LDAP_AUTHENTICATION_TYPE=SIMPLE

## Prefix to search the users within 
LDAP_USER_PREFIX=uid=

## Suffix to search the users within
LDAP_USER_SUFFIX=ou=people,dc=example,dc=com

## Set to True to use LDAPS
LDAP_USE_SSL=True

## Set to True to verify the server certificate validity
LDAP_VALIDATE_CERTIFICATE=True

## TLS version to use LDAPS
LDAP_TLS_VERSION=1.2

## LDAP TLS configuration 
LDAP_CUSTOM_TLS_CONFIG=False

# Set email address of the first user, that will be the admin 
IRIS_ADM_EMAIL=adm@example.com 
```

#### Setting up for Active Directory
To use LDAP with an Active Directory, the following settings can be used: 

```bash title="Example of LDAP configuration for first run with Active Directory"

IRIS_AUTHENTICATION_TYPE=ldap

## IP address or FQDN of the ldap server
LDAP_SERVER=dc1.domain.local

## Port of the LDAP server
LDAP_PORT=636

## LDAP Authentication type
LDAP_AUTHENTICATION_TYPE=SIMPLE

## Prefix to search the users within
LDAP_USER_PREFIX=DOMAIN\

## Suffix to search the users within
LDAP_USER_SUFFIX=

## Set to True to verify the server certificate validity
LDAP_VALIDATE_CERTIFICATE=True

## TLS version to use LDAPS
LDAP_TLS_VERSION=1.2

## LDAP TLS configuration 
LDAP_CUSTOM_TLS_CONFIG=False

# Set email address of the first user, that will be the admin
IRIS_ADM_EMAIL=adm@example.com 
```


#### Setting up LDAP after IRIS already ran
To set up LDAP after IRIS was already run, one only needs to set up the settings described previously without # Set email address of admin 
`IRIS_ADM_EMAIL=adm@example.com` and restart the docker.  


!!! Info "**Usernames in IRIS have to match the ones set in LDAP for the authentication to succeed.**" 


### LDAP certificates
If the LDAP server uses a self-signed certificate, it is possible to add it to the trusted certificates of the IRIS WebApp docker. 

1. Copy the certificate to the `certificates/ldap` folder of the IRIS root directory.
2. Set the `LDAP_VALIDATE_CERTIFICATE` environment variable to `True` in the `.env` file.
3. Set the `LDAP_CUSTOM_TLS_CONFIG` environment variable to `False` in the `.env` file.
4. Set the `LDAP_CA_CERTIFICATE` environment variable certificate path used by the LDAP server in the `.env` file.

If the LDAP server requires a client certificate, it is possible to add it to the trusted certificates of the IRIS WebApp docker. 

1. Copy the certificate and key to the `certificates/ldap` folder of the IRIS root directory.
2. Set the `LDAP_VALIDATE_CERTIFICATE` environment variable to `True` in the `.env` file.
3. Set the `LDAP_CUSTOM_TLS_CONFIG` environment variable to `True` in the `.env` file.
4. Set the `LDAP_PRIVATE_KEY` environment to the file name of the key in the `.env` file 
5. Set the `LDAP_PRIVATE_KEY_PASSWORD` environment variable to the password of the key in the `.env` file - if needed 


## OIDC authentication

The following needs to be set in the `.env`.  

```
IRIS_AUTHENTICATION_TYPE=oidc
OIDC_ISSUER_URL = 
OIDC_CLIENT_ID = 
OIDC_CLIENT_SECRET = 
OIDC_AUTH_ENDPOINT = {optional}
OIDC_TOKEN_ENDPOINT = {optional}
OIDC_END_SESSION_ENDPOINT = {optional}
OIDC_SCOPES = {optional , fallback="openid email profile"}
OIDC_MAPPING_USERNAME = {optional ,  fallback='preferred_username'}
OIDC_MAPPING_EMAIL = {optional , fallback='email'}
```

On the OIDC provider, the URI to set is `/oidc_authorize`.   

## Advanced 

### MFA 

MFA can be enforced for all users by heading to the `Advanced` > `Server Settings` > `Multi-Factor Authentication` section and enabling `Enforce MFA for all users`.   
During the next login, the user will be prompted to set up MFA.  

## Hybrid setups

IRIS can be use in hybrid setup as follow: 

- `LDAP` and `Local` : If the user is not found in LDAP, the local database is checked. In that case, `AUTHENTICATION_LOCAL_FALLBACK` needs to be set to `True` in the `.env`. 
- `OIDC` and `Local` : If the user is not found in OIDC, the local database is checked. In that case, `AUTHENTICATION_LOCAL_FALLBACK` needs to be set to `True` in the `.env`. 