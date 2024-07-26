# Alerts 

!!! info "Introduced in IRIS v2.1.0"


Alerts can be fed directly into IRIS using the [Alerts API](https://docs.dfir-iris.org/_static/iris_api_reference_v2.0.1.html#tag/Alerts).   
Any source can inject alerts into IRIS, as long as it can send HTTP requests and respects the alert format.    

A service account with the `alert_read` and `alert_write` permission can be used to send alerts to IRIS.


!!! warning
    This section is only available for users with the `alert_read` and `alert_write` permissions. Only alerts for customers that are linked to the respective user will be visible.


## Viewing alerts

Alerts can then be viewed in the `Alerts` section of IRIS. Analysts can then triage the alerts and create cases from them.   

![Alerts](/_static/alerts/alerts_main.png){ align=center }

Each alert can be expanded to show more details.  


## Alerts assignment
Alerts can be assigned to analysts. This can be done directly from the alert view.  

To self-assign an unassigned alert, click on the hand icon on the left. 

![Alerts](/_static/alerts/alert_assignment.png){ align=center }

Clicking again on the hand icon will prompt with a list of analysts to assign the alert to.  

The right button `Assign`, when hovering above an alert, can also be used to assign the alert to an analyst.

## Merge / escalation operations
### Creating cases from alerts
Alerts can be escalated/merged into a new case. When hovering above an alert, a `Merge` button will appear.  

![Alerts](/_static/alerts/alert_escalate.png){ align=center }

Once clicked, a new window appears, requesting additional information.  In this window, the analyst can: 

- Set the name of the case 
- Select the case template
- Select the IOCs to import 
- Select the assets to import
- Add an escalation note
- Set the case tags 
- Choose if the alert should be imported in the timeline as an event  


### Merge alerts into an existing case
Alerts can also be escalated/merged into an existing case. When hovering above an alert, a `Merge` button will appear.  

Once clicked, a new window appears requesting additional information.  The button `Merge into existing case` needs to be clicked.   
A new dropdown appears and allows to select the case to merge the alert into.   

Similar to the case creation, the analyst can: 

- Select the IOCs to import
- Select the assets to import
- Add an escalation note
- Choose if the alert should be imported in the timeline as an event

The selected IOCs and assets are then added to the selected case.  


### Unmerge alerts from a case
Alerts can be unmerged from a case. 

!!! info 
    When unmerging an alert, the alert is not deleted. It is only removed from the case. The alert state is not changed.  
    The IOCs and assets are not removed from the case.  


When a case is merged, a new link appears on the alert and mentions the case it was merged into.  
Clicking on this link allows to browse the case or to unmerge the alert. 

![Alerts](/_static/alerts/unmerge_alert.png){ align=center }



## Alerts relationships

Each alert have a `Relastionships` section. This section shows the relationships between the alert and other objects in IRIS. This feature is in preview and might report false relationships.   

The relationships are computed using the following logic:

- Same IOC, based on the IOC type and value
- Same Asset, based on the asset type and name 


By default the view limits the relationships to 100 nodes and looks back 7 days. This can be updated directly in the alert view.  

![Alerts](/_static/alerts/alerts_relations.png){ align=center }
