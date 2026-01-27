# Upgrades

Most of the time, Iris handles upgrades of the database automatically when a new version is started, thus no specific actions are required.  
**However**, some breaking changes might need manual intervention.  Please use the selectors below to assess if a manual action is required. 

!!! cite ""
    <label for="cversion-select">Your current version:</label>
    <select name="current_version" class="md-select" id="cversion-select">
    </select>

    <label for="tversion-select">Upgrading to:</label>
    <select name="target_version" class="md-select" id="tversion-select">

    </select>

    <button class="md-button" onclick='check_versions();'>
      <span class="">Check upgrades conditions</span>
    </button>

<div id="migration-info"></div>

**For production environments, it is highly recommended to make backups of the DB in case any issues occur during upgrades.**  

-------------
## Backing-up DB
Only if you run in production and/or data is critical. 

1. List the current running docker containers `docker container list`
2. Spot the IRIS DB container name or ID, and execute the backup

```bash
  docker exec <container> pg_dump -U postgres iris_db | \ 
    gzip > ../iris_db_backup.gz
```

3. Ensure the backup was successful by looking at the gz file 

```bash
  zcat ../iris_db_backup.gz | less 
```

-------------
## Upgrading
1. Stop the dockers 
    ```
    docker-compose stop
    ```

2. Remove the application dockers 
    ```
    docker-compose rm app worker
    ```

3. Get the last version of Iris 
    ```
    git pull 
    git checkout <last_tagged_version>
    ```
    
    eg ``git checkout v2.4.26``

4. Pull the new version 
    ```
    docker compose pull
    ```

5. Run IRIS again. The app will handle the DB migration automatically.
    ```
    docker compose up
    ```

-------------

## Rolling back

In case something went wrong, you can rollback to your previous version and restore data. 

1. Remove the faulty docker DB ``docker-compose down db --volumes``
2. Checkout to the previous version working of IRIS 
3. Rebuild the images ``docker-compose build --no-cache``
4. Spin up the docker DB, and ONLY this one. ``docker-compose up db``
5. Get the ID or name of the docker DB ``docker container list``
6. Restore the DB data ``zcat ../iris_db_backup.gz | docker exec -i <container> psql -U postgres -d iris_db``
7. Spin up the rest of the dockers ``docker-compose up``
8. Your data should back.


-------------
## Version specific upgrades

### v2.4.8 and onwards

The default docker compose file now pulls prebuilt images from the Docker Hub. This is done to speed up the deployment process.   
❗ Custom docker compose file need to be updated to reflect this change. 


### v2.4.0 to v2.4.7

!!! warning
    v2.4.0 to v2.4.6 contains bugs. Please upgrade to v2.4.7 directly. 

The update from previous versions to this one is done automatically. **However it introduces a number of changes in the API and access control. It may thus break integrations.**

!!! danger 
    Access control has been updated. Starting from this version, **all users have by-default access deny to all the cases**, expect explicitely specified otherwise by group membership or automatic access rights.  
    Users can also now be linked to customers, which automatically give them access to the related alerts and cases.   

- The migration to the new access control system is done automatically. 
- New users will not have access to any cases until they are explicitely granted access.  
- Existing users will keep their previous access rights. 
- Existing users will not be linked to any customer. They will need to be linked to a customer to have access to the new cases. 
- Existing users not linked to customers will not see any alerts. They need to be added to the corresponding customer to see the alerts.  

Please refer to the API documentation to update any integration which may use the following features: 

- Notes 
- Timeline 
- Acccess control 

The layout of the reporting has been updated as well. Refer to the `https://<server>/case/export?cid=<case_id>` endpoint to get all the possible fields.

### v2.3.4

❗ The layout of the reporting has slightly changed. Custom report templates might not work anymore.
You can use `https://<server>/case/export?cid=<case_id>` to get all the possible fields.

No other impact is to be expected.   


### v2.1.0 
The default location of the SSL certificates have been changed from `dockers/nginx/dev_certs` to `certificates/nginx/web_certificates`.  
The `docker-compose.yml` has thus been updated to mount this volume on the nginx Docker.   

Except these changes, users in v2.0.x can upgrade to v2.1.0 without any manual intervention.   
Users in v1.4.x need to follow the [v2.0.0 upgrade instructions](#v200) before upgrading to v2.1.0.  

### v2.0.0 
#### Breaking changes
This version brings breaking changes on the following: 

 - API 
 - Modules 
 - Python Client 
 - Environment variables in the `.env` configuration
 - Default listening ports of IRIS WebApp

!!! warning 
     Custom made modules need to be upgraded to IRIS Module Interface v1.2.0. Please see [modules upgrade for v2.0.0](#v200-modules-upgrades)

#### Instance migration
To migrate an instance from v1.4.5, one can use the script in `upgrades/upgrade_to_2.0.0.py` located in the repository.   
These commands needs to be run from the root of the repository (`pwd` should return something like `/iris-web`):  

```bash
# Pull the lastest version 
git pull 

# Checkout to iris v2.0.0
git checkout v2.0.0 

# Check if upgrades possible
python3 upgrades/upgrade_to_2.0.0.py --check

# Run the upgrade
python3 upgrades/upgrade_to_2.0.0.py --install
```

The script will take care of migrating the environment variables to reflect the changes in v2.0.0. Please review the `.env` file afterward.   

The port have been changed 443. The script asks if the previous port should be kept or migrated to the new one. 

Once validated, one can proceed with the usual upgrade methodology.  

```
docker-compose stop 
docker-compose build --no-cache 
docker-compose up -d
```

#### v2.0.0 modules upgrades
This only concerns custom modules not shipped with IRIS Web App.  
The IRIS module interface has been upgraded to v1.2.0. No breaking changes are associated. One need to change the `iris_module_interface` dependency to 1.2.0 in the requirements and rebuild the module.  

#### Python client 
The client has been updated to reflect the latest changes of the API. It also integrates features that were missing previously, such as Datastore Management.   
Some methods have been deprecated and some other modified. The easiest way to upgrade is to increase the version in the requirements and test. Each deprecated method will produce a warning or raise an exception.  

### v1.4.5
**If you are coming from IRIS <= v1.3.1 please read [this](#v144).**  
Changes have been made to the NGINX docker to allow upload of big files for the datastore. It is hence necessary to also rebuild the NGINX docker this time.  

1. Stop the dockers ``docker-compose stop``
2. Remove the application dockers ``docker-compose rm app worker``
3. Get the last version of Iris ``git checkout <last_tagged_version>`` - eg ``git checkout v1.4.5``
4. Build the new versions ``docker-compose build --no-cache app worker nginx``
5. Run IRIS again. ``docker-compose up``


### v1.4.4
**This only applies if you are coming from IRIS <= v1.3.1.**

This version brings breaking changes in the DB docker by adding a named volume instead of the default one.
This implies that previous existing database is ignored as the new docker won't know which volume was previously used.   
To prevent this, please **strictly follow the guide below**. This will copy the data of the existing volume, to the new named one. 

1. Spot the IRIS DB container with ``docker container list``. It should look like `iris-web-db-x`
2. Fetch the current db volume ID (`name` field with the command below)

```bash
docker inspect <iris_db> | grep -A5 "Mounts"

# Example of output
"Mounts": [
  {
      "Type": "volume",
      "Name": "a90b9998a3233a68438c8e099bd0ba98d9f62c9734e40297b8067f9fdb921eb9",
      "Source": "/var/lib/docker/volumes/a90b9998a3233a68438c8e099bd0ba98d9f62c9734e40297b8067f9fdb921eb9/_data",
      "Destination": "/var/lib/postgresql/data",
```
3. Stop all the IRIS dockers : ``docker-compose stop``  
4. Create a new empty volume : ``docker volume create --name iris-web_db_data``   
5. Run a volume copy via a dummy image : 
```bash
docker run --rm -it -v <previous_db_volume_id>:/from:ro -v iris-web_db_data:/to alpine ash -c "cd /from ; cp -av . /to"

# With the example of 2., this gives 
docker run --rm -it -v a90b9998a3233a68438c8e099bd0ba98d9f62c9734e40297b8067f9fdb921eb9:/from:ro -v iris-web_db_data:/to alpine ash -c "cd /from ; cp -av . /to"
```
6. Pull the last changes from the repository, checkout to `v1.4.4`, build and run. 
  
```bash
git pull origin 
git checkout v1.4.4
docker-compose build 
docker-compose up 
```
7. The data should be successfully transferred.

**Do not forget to clear out your browser cache, many JS files were changed.**

### v1.4.3
A patch exists for this version. Please directly upgrade to [v1.4.4](#v144)

### v1.4.2
A patch exists for this version. Please directly upgrade to [v1.4.4](#v144)

### v1.4.1
A patch exists for this version. Please directly upgrade to [v1.4.4](#v144)


### v1.4.0
A patch exists for this version. Please directly upgrade to [v1.4.4](#v144)

<script>
const versions = [
    "v1.2.1", "v1.3.0", "v1.3.1", "v1.4.0", "v1.4.1", "v1.4.2", "v1.4.3", "v1.4.4", "v1.4.5",
    "v2.0.0", "v2.0.1", "v2.0.2", "v2.1.0", "v2.2.0", "v2.2.1", "v2.2.2", "v2.2.3",
    "v2.3.0", "v2.3.1", "v2.3.2", "v2.3.3", "v2.3.4", "v2.3.5", "v2.3.6", "v2.3.7",
    "v2.4.5", "v2.4.6", "v2.4.7", "v2.4.8", "v2.4.9", "v2.4.10", "v2.4.11", "v2.4.12", "v2.4.13",
    "v2.4.14", "v2.4.15", "v2.4.16", "v2.4.17", "v2.4.19", "v2.4.20", "v2.4.21", "v2.4.22", 
    "v2.4.23", "v2.4.24", "v2.4.25", "v2.4.26", "v2.4.27" 
];


// Function to populate the version dropdowns
function populateVersionDropdowns() {
  const currentVersionSelect = document.getElementById("cversion-select");
  const targetVersionSelect = document.getElementById("tversion-select");

  currentOption = document.createElement("option");
  currentOption.value = "";
  currentOption.textContent = "Choose your current version";
  currentVersionSelect.appendChild(currentOption);

  currentOption = document.createElement("option");
  currentOption.value = "";
  currentOption.textContent = "Choose the target version";
  targetVersionSelect.appendChild(currentOption);

  versions.forEach(version => {
    let currentOption = document.createElement("option");
    currentOption.value = version;
    currentOption.textContent = version;
    currentVersionSelect.appendChild(currentOption);

    let targetOption = document.createElement("option");
    targetOption.value = version;
    targetOption.textContent = version;
    targetVersionSelect.appendChild(targetOption);
  });
}

// Execute dropdown population on page load
document.addEventListener("DOMContentLoaded", populateVersionDropdowns);



function check_versions() {
    const cversion = document.getElementById("cversion-select").value;
    const tversion = document.getElementById("tversion-select").value;

    if (!cversion || !tversion) {
        return;
    }

    const autoUpgradeVersions = [
        "v1.3.0", "v1.3.1", "v2.0.1", "v2.0.2", "v2.2.0", "v2.2.1", "v2.2.2", "v2.2.3",
        "v2.3.0", "v2.3.1", "v2.3.2", "v2.3.3", "v2.3.4", "v2.3.5", "v2.3.6", "v2.3.7",
        "v2.4.8", "v2.4.9", "v2.4.10", "v2.4.11", "v2.4.12", "v2.4.13", "v2.4.14", "v2.4.15", "v2.4.16",
        "v2.4.17", "v2.4.19", "v2.4.20", "v2.4.21",  "v2.4.22", "v2.4.23", "v2.4.24", "v2.4.25", "v2.4.26", "v2.4.27"         
    ];

    const actionRequiredVersions = {
        "v1.4.0": "#v140", "v1.4.1": "#v141", "v1.4.2": "#v142", "v1.4.3": "#v143",
        "v1.4.4": "#v144", "v1.4.5": "#v145", "v2.0.0": "#v200",
        "v2.4.5": "#v240-to-v247", "v2.4.6": "#v240-to-v247", "v2.4.7": "#v240-to-v247"
    };

    const seeNotesVersions = {
        "v2.1.0": "#v210", "v2.2.0": "#v210", "v2.2.1": "#v210", "v2.2.2": "#v210", "v2.2.3": "#v210"
    };

    const headActionRequired = '<p><span class="twemoji"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M8.22 1.754a.25.25 0 0 0-.44 0L1.698 13.132a.25.25 0 0 0 .22.368h12.164a.25.25 0 0 0 .22-.368L8.22 1.754zm-1.763-.707c.659-1.234 2.427-1.234 3.086 0l6.082 11.378A1.75 1.75 0 0 1 14.082 15H1.918a1.75 1.75 0 0 1-1.543-2.575L6.457 1.047zM9 11a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm-.25-5.25a.75.75 0 0 0-1.5 0v2.5a.75.75 0 0 0 1.5 0v-2.5z"></path></svg></span> <code>Action required</code> - See ';
    const headSeeNotes = '<p><span class="twemoji"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M8.22 1.754a.25.25 0 0 0-.44 0L1.698 13.132a.25.25 0 0 0 .22.368h12.164a.25.25 0 0 0 .22-.368L8.22 1.754zm-1.763-.707c.659-1.234 2.427-1.234 3.086 0l6.082 11.378A1.75 1.75 0 0 1 14.082 15H1.918a1.75 1.75 0 0 1-1.543-2.575L6.457 1.047zM9 11a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm-.25-5.25a.75.75 0 0 0-1.5 0v2.5a.75.75 0 0 0 1.5 0v-2.5z"></path></svg></span> <code>See notes</code> in ';

    const div = document.getElementById('migration-info');
    div.innerHTML = '';

    if (cversion === tversion) {
        div.innerHTML = `<div class="admonition question">
            <p class="admonition-title">Let's talk</p>
            <p>We're not sure that's really useful. Coffee instead?</p>
            </div>`;
        return;
    }

    const cIndex = versions.indexOf(cversion);
    const tIndex = versions.indexOf(tversion);

    if (cIndex === -1 || tIndex === -1) {
        div.innerHTML = `<div class="admonition failure">
            <p class="admonition-title">Incompatible</p>
            <p>Migration from ${cversion} to ${tversion} is not possible</p>
            </div>`;
        return;
    }

    if (cIndex >= tIndex) {
        div.innerHTML = `<div class="admonition failure">
            <p class="admonition-title">Incompatible</p>
            <p>Downgrading from ${cversion} to ${tversion} is not supported</p>
            </div>`;
        return;
    }

    let upgradeMessage = '';
    let directUpgrade = true;

    for (let i = cIndex + 1; i <= tIndex; i++) {
        const version = versions[i];
        if (actionRequiredVersions[version]) {
            upgradeMessage += `<div class="admonition danger">
                <p class="admonition-title">Caution</p>
                <p>${headActionRequired}<a href="${actionRequiredVersions[version]}">${version}</a></p>
                </div>`;
            directUpgrade = false;
        } else if (seeNotesVersions[version]) {
            upgradeMessage += `<div class="admonition danger">
                <p class="admonition-title">Caution</p>
                <p>${headSeeNotes}<a href="${seeNotesVersions[version]}">${version}</a></p>
                </div>`;
            directUpgrade = false;
        }
    }

    if (directUpgrade && autoUpgradeVersions.includes(tversion)) {
        div.innerHTML = `<div class="admonition success">
            <p class="admonition-title">Good news</p>
            <p>${cversion} can be upgraded to ${tversion} automatically</p>
            </div>`;
    } else {
        div.innerHTML = upgradeMessage || `<div class="admonition failure">
            <p class="admonition-title">Incompatible</p>
            <p>Migration from ${cversion} to ${tversion} is not possible</p>
            </div>`;
    }
}


</script>