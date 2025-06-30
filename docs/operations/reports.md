# Reports

IRIS has the ability to generate reports based on the data of an investigation.
The reports templates can be managed in ``Advanced`` > ``Templates``.

!!! info
    This section is only available for users with the Admin role.

There is two types of reports : 

- **Investigation**; these contains the investigation data and can produces a custom-ready document
- **Activities**; these contains activities done on the case and can be used as a follow-up

## Supported formats 
The following report formats are supported: 

- docx 
- markdown (.md)
- html 

## Structure of templates
Reports templates are made of tags, which are then processed and filed by the template engine of IRIS.
The templates can have any forms as soon as they respect the tags. We are providing two example of reports. 

- Example of investigation template : [Download](example_reports/iris_report_template.docx) 
- Example of activities report template : [Download](example_reports/iris_activity_report_template.docx)

!!! info 
    The templates includes a few lines that describes how to handle styles. These should not be removed. 
    They are be present in the generated reports and need to be removed manually. 

    ![docx](../_static/docx_templating_lines.png)

## Available tags
The following tags are available. None are mandatory. If a tag is mistyped, the generation step will produce an error message.

!!! hint 
    To get the list of available tags for a specific IRIS version, head to `/case/export?cid=1`. 
    

!!! hint 
    Standard objects are accessible with ``{{ objectname }}``.
    List objects can be looped:

    ```
      {% for object in object_list %}
        {{ object.attribute }}
      {% endfor %} 
    ```


- ``case.name``: Name of the case
- ``case.description``: Description of the case
- ``case.open_date``: Case open date 
- ``case.close_date``: Case close date 
- ``case.opened_by``: User that initially opened the case 
- ``case.soc_id``: SOC ID number linked to the case 
- ``case.client``: Customer linked to the case
    - ``case.client.customer_name``: Name of the customer
    - ``case.client.customer_description``: Description of the customer
    - ``case.client.customer_sla``: Description of the Service Level Agreement with the customer
- ``evidences``: List of evidence objects (see below - given ``evidence`` as loop variable)
    - ``evidence.filename``: File name of the evidence 
    - ``evidence.date_added``: Date of registration 
    - ``evidence.file_hash``: Hash of the evidence 
    - ``evidence.added_by``: User who added the evidence
    - ``evidence.custom_attributes``: Custom attributes of the evidence

- ``iocs``: List of IOCs objects (see below - given ``ioc`` as loop variable)
    - ``ioc.ioc_value``: Value of the IOC 
    - ``ioc.ioc_description``: Description of the IOC
    - ``ioc.ioc_type``: Type of IOC 
    - ``ioc.ioc_tags``: Tags linked to the IOC 
    - ``ioc.custom_attributes``: Custom attributes of the IOC

- ``notes``: List of notes objects (see below - given ``note`` as loop variable)
    - ``note.note_title``: Title of the note 
    - ``note.note_content``: Content of the note 
    - ``note.note_creationdate``: Creation date of the note 
    - ``note.note_lastupdate``: Date of last update 
    - ``note.custom_attributes``: Custom attributes of the note

- ``tasks``: List of tasks objects (see below - given ``task`` as loop variable)

    - ``task.task_title``: Title of the task 
    - ``task.task_description``: Description of the task 
    - ``task.task_open_date``: Open date of the task 
    - ``task.task_last_update``: Last update of the task 
    - ``task.task_close_date``: Date of closure 
    - ``task.task_status``: Status of the task 
    - ``task.task_tags``: Task for the tags 
    - ``task.custom_attributes``: Custom attributes of the task

- `timeline`: List of events objects (see below - given ``event`` as loop variable)

    - ``event.event_title``: Title of the event 
    - ``event.event_content``: Content of the event 
    - ``event.event_raw``: Raw content of the event 
    - ``event.event_date``: Date when the event happened 
    - ``event.event_source``: Source of the event 
    - ``event.category``: Category of the event 
    - ``event.event_tags``: Tags of the events 
    - ``event.last_edited_by``: User who last edited the event 
    - ``event.assets``: List of assets names linked to the event
    - ``event.custom_attributes``: Custom attributes of the event


## Examples 
### Full documents 
We are providing two example of full reports. 

- Example of investigation template : [Download](example_reports/iris_report_template.docx) 
- Example of activities report template : [Download](example_reports/iris_activity_report_template.docx)


### Snippets 
The following snippets aimed to be placed directly in the DOCX documents.

#### Loops and tables 
##### Standard loops
A loop needs to be used for list objects. 
``` title="Loop on IOC example"
The IOCs of this case are : 

{% for ioc in case.iocs %}
    - {{ ioc.ioc_value }}
    - {{ ioc.ioc_description }}
{% endfor %}
```

##### Table loops
To use a loop in a table, a `tr` tag needs to be added to the loop and the loop directly integrated in the table. 
``` title="Loop on IOC table example"
The IOCs of this case are in the following table : 

{%tr for ioc in case.iocs %}
    {{ ioc.ioc_value }}
    {{ ioc.type_name }}
    {{ ioc.ioc_description }}
{%tr endfor %}
```
Such as : 

![docx](../_static/docx_ioc_loop.png)

##### Nested loops
Loops can be nested. Don't forget to close each loop. 

``` title="Nested loop"
{%for ioc in case.iocs %}

    Custom attributes of {{ ioc.ioc_value }} :

    {% for attribute in ioc.custom_attributes %}

        - {{ attribute }}

    {% endfor %}

{% endfor %}
```

### Conditions 
#### Standard 
``` title="Check if asset is compromised"
{% for asset in assets %} 
    
    {% if asset.compromised %}
        Asset {{ asset.asset_name }} is compromised
    {% endif %}

{% endfor %}
```

#### List is not empty
To check if a list of objects is not empty, use the processor tag `count`.

``` title="Check if case has assets"
{% if assets|count %} 
    The case has assets
{% endif %}
```

#### Markdown handling
The case summary and notes are in markdown. A processor tag should thus be added `|markdown`.
``` title="Summary as markdown"
This is an example of summary : 

{{ case.description|markdown }}
```

``` title="Loop over notes"
This is an example of recursive notes  : 

{% for note in notes %}

    My note named {{ note.note_title }} : 
    {{ note.note_content|markdown }}

{% endfor %}
```

## Troubleshoot 
Most of the time an error of generation is due to misspelled tag or a missing closing tag (`{% endfor %}`, `{% endif %}`, etc).
In case you cannot figure out what is going wrong, don't hesitate to reach us on Discord.
