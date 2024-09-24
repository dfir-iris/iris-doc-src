# Structure overview 

## Flask 
IRIS uses [Flask](https://flask.palletsprojects.com/en/2.1.x/) for the web engine.  

### Routes and blueprints
Each page and API endpoints (eg `/login`, `/dashboard`, `/case/assets/list`, etc) refers to a route in the IRIS Flask app. They define what the application should do when Flask receives a request on an URI.  
To keep structure in the projects, these routes are grouped by `Blueprints`. The Blueprints reflects the structure shown in the IRIS UI left menu. For instance there is a `case` and an `activities` Blueprint.  

The Blueprints and thus routes are defined in `source > app > blueprints`.   
All the blueprints are registered in `source > app > views.py`.  

### Templates 
IRIS uses dynamic page templating when an URI is visited. These [Jinja2](https://jinja.palletsprojects.com/en/3.1.x/) templates are filled at runtime with the needed information and then returned to the client.   
Each route offering a page (i.e non-API endpoints) thus relies on a template. These are set in a folder named `templates` in each Blueprint.  
For instance, for the dashboard template : `source > app > blueprints > dashboard > templates > index.html`.  

### Static contents 
Static content is served from a common folder under `ui`.  It contains CSS, JS and images. These can be accessed by pages using `"/static/assets/<the-resource>"`.

## SQLAlchemy 
For the database management, the application uses [SQLAlchemy](https://www.sqlalchemy.org/) with a PostgreSQL backend. There is - normally - no need to directly deal with PostgreSQL, everything goes through SQLAlchemy.   
It provides a Python overlay which allows to talk to the DB with objects.   

### Models 
Each table of the app is defined by a model.  These are defined in `source > app > model`.  When IRIS starts, it looks for the already created tables and creates the missing ones if needed.  
If changes are done on a table or field, then a migration is needed. This is explained in [Alembic migrations](/development/db-migration/).  


### Requests 
To help structuring the code, we are trying to move the DB code from the routes code. This is partially done and work in progress.  
If your route requests the DB, please put the DB code in `source > app > datamgmt`.  


## Alembic 
To apply schema migration without the need to rebuild the DB, IRIS uses [Alembic](https://alembic.sqlalchemy.org/en/latest/).  
It allows to define migration scheme and IRIS calls it when it starts so users can upgrade without too much hassles. 

## Hooks, modules and tasks 
Modules are handled via tasks thanks to Celery and RabbitMQ. [More info here](/development/hooks/) and [here](/development/modules/). 


## IRIS startup
When starting-up, IRIS initiates a bunch of DB objects, whether it is started for the first time or just restarted. Objects already created are not recreated, but the missing ones are applied. This ensure a smooth migration between versions.  
These are defined in `source > app > post_init.py`.  The scripts also contains the code that runs th DB migration with Alembic.  
