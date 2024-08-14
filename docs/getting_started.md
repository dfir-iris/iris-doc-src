# Quick Start

The most straightforward and recommended way to use IRIS is with Docker. This is presented here. 

!!! warning "Disclaimer"

    IRIS is in its early stage. It can already be used in production, but please [set backups of the database](/operations/upgrades/#backing-up-db) and DO NOT expose the interface on the Internet.
    We highly recommended the use of a private dedicated and secured network. 
    

## Pre-requisites

### Hardware

IRIS does not require a lot of resources, and it can be run on a small laptop (4 cores, 8Gb of RAM). However, for large a organization and heavy usage, 
it will need to be significantly scaled up.  
We don't have benchmarks yet, but keep in mind that the database can grow rapidly and modules can require more resources depending on their purposes.  

### Docker
Docker and docker compose are needed to build and run the project. Depending on the OS you will find all the information to install them on 
the official website of [Docker](https://docs.docker.com/get-docker/).  

The platform is officially supported on most Linux and MacOS. While it should work on Windows, some path needed by the containers to store permanent files might need to be changed in the dockerfiles. 

## Versioning
Starting from version 2.0.0, Iris is following the [Semantic Versioning 2.0](https://semver.org/) guidelines.   
The code ready for production is always tagged with a version number. 
``alpha`` and ``beta`` versions are **not** production-ready.  

**Do not use the ``master`` branch in production.** 

## Build and Run

To build and run IRIS, follow these steps:

1. Clone the `iris-web` repository:

    ```bash
    git clone https://github.com/dfir-iris/iris-web.git
    cd iris-web
    ```

2. Check out the latest **non-beta** tagged version: 

    ```bash
    git checkout v2.4.11
    ```

3. Copy the environment file 

    ```
    cp .env.model .env
    ```

    !!! warning "Warning"
        The default configuration is suitable for testing only. To configure IRIS for production, see the [configuration section](operations/configuration.md). 

4. Pull the Docker containers:

    ```
    docker compose pull
    ```

5. Start IRIS:

    ```bash
    # Add "-d" to put it in the background
    docker compose up
    ```

IRIS should now be available on the host interface, port 443, using HTTPS protocol by default. You can access it by navigating to https://hostip in your web browser.   

By default, an administrator account is created when IRIS is started for the first time. The password is printed in the console output. You can search for ```WARNING :: post_init :: create_safe_admin :: >>>``` in the logs to find the password.   
Running `docker compose logs app | grep 'admin'` should help to find it.   

If you want to define an admin password at the first start, you can create and define the environment variable `IRIS_ADM_PASSWORD` in the `.env`. **This has no effect once the administrator account is created.**   

Note that IRIS is split into five Docker services, each with a different role:

- `app` - iris_webapp: The core, including web server, database management, module management, etc.
- `db`: A PostgreSQL database
- `RabbitMQ`: A RabbitMQ engine to handle job queuing and processing
- `worker`: A job handler relying on RabbitMQ
- `nginx`: A NGINX reverse proxy

Each service can be built independently, which is useful when developing. In this QuickStart, all services are built at once.  

![IRIS Structure](/_static/iris_structure.png){ align=center }

## Additional configuration

Please see [configuration](operations/configuration.md) for more details.

### Kubernetes

For enterprises wishing to run their instance of IRIS, utilizing the projects official Helm charts and/or Kustomize manifests, allows them to significantly enhance their deployment and management, presenting a powerful solution to streamline their IRIS deployment and management processes, efficiently running across a cluster of machines, ensuring high availability and seamless scaling as demand fluctuates.

The deploy directory in the iris-web GitHub repository provides a practical starting point for deploying IRIS on their preferred managed k8s platform. We've created two variants: eks and gke, feel free to customize each with your own values.

For more details, please visit the deploy directory on GitHub: [deploy](https://github.com/dfir-iris/iris-web/tree/master/deploy)
