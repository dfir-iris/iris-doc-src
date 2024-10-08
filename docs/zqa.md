# Q & A

## General questions
#### Which version should I install?
The master branch is stable as all the development is done under the develop branch and merged once ready.  
To ease the identification, each new version is tagged and a new release is published. We recommend using these.  
```git checkout <tagged_version>```

#### Is the project maintained?
Yes, IRIS is under heavy development. We are adding more and more features, led by feedbacks from the community.  

#### What is the future of the project?
We aim to make it evolve as much as possible with the help of the community. We have long term goals to integrate it seamlessly 
with project like MISP and other OS project, but we don't provide any commitment on how and when to avoid any unmet expectations. 
For a short term roadmap, you can head to the [Github project](https://github.com/orgs/dfir-iris/projects/1).   

#### How can I contact the DFIR-IRIS team?
You can reach us on [discord](https://discord.gg/76tM6QUJza), [Twitter](https://twitter.com/dfir_iris) or by [email](mailto:<contact@dfir-iris.org>).


## Cases

#### Can I recover a deleted case?  
No. Cases are deleted from the database and changes are committed. 
There is no coming back unless you have made backups of the database (which we recommend).

#### Can I recover a deleted case object? 
No. Every object such as IOCs, assets, events, notes, etc are immediately deleted from the database and changes are committed. 

#### Can I add a new asset type?
Yes. With a user that have administrative rights, go to `Advanced` > `Case Objects`. 

#### Can I add a new IOC type?
Yes. Starting from v1.3.0, IOC types can be manipulated. Head to `Advanced` > `Case Objects`  

#### Can I add new fields to case objects such as IOCs, Assets, etc?
Yes. Starting from v1.4.0, all case objects can be extended thanks to custom attributes. 
With a user that have administrative rights, go to `Advanced` > `Custom Attributes`. 

#### Can I search into custom attributes fields?
Not for now. The searches in each case objects page are done client-side, and the attributes are not fetched.  
We will however implement a server side search in next releases.  

#### Can I create two cases with the same name for the same customer?  
Yes. Cases are identified with a unique number, so they can have the same name. 

#### Can I restrict the view of case to a set of users?
Yes it is since v2.0.0. See [Access control](operations/access_control).  

#### Can I change the name or customer of an existing case?
Yes it is since v2.0.0. 

Operations
----------

#### What is the password policy? Can it be changed?
Before v1.4.5, the password policy is hardcoded and cannot be changed.   
It should be 12 characters minimum and contains a capital letter and a number.    
After v1.4.5, the password policy can be changed in `Advanced` > `Server settings`.   

#### Can I change my profile picture?
No, not for now. This wasn't a priority for us, it will be released in future versions. 

#### I lost the administrator password, can I recover it?
Passwords are hashed so they can't be recovered. But you can change it.  
Please see [changing a lost password](operations/access_control/authentication.md#changing-a-lost-password).  

#### Can I delete a user?
No. To keep consistencies in the database, users unfortunately cannot be deleted if they have done some activities.  
You can however disable them to prevent them appearing in the UI and connecting to the plafeform.  

#### Can I delete a customer?   
No. To keep consistencies in the database, customers unfortunately cannot be deleted if they are linked to cases. 

#### Can I prevent backrefs of assets and IOCs?
No. It might be possible in future versions but for now it is better to spin up a new instance for restricted cases. The backref is however automatically disabled for performance reasons, for cases with more than 300 assets. We are working on a more efficient way to backref. 

#### My report template is not generated and generates an error
Please triple check typos in tags as there is no fault tolerance. You can reach us in case of troubles.  


# Integration
#### Can I enrich IOCs with external sources?   
Starting from v1.4.0, it is now possible to easily develop module to enrich case objects. A module Iris VT and IRIS MISP are already provided.  

#### Is there an API client?
Yes, you can find it [on our Github](https://github.com/dfir-iris/iris-client). 

### I added alerts via the API but I don't see them on the UI 
If the server replied `200` for the alert creation, it means the alert is stored in IRIS.  
If your user do not see the alerts, it means it needs to be added to the appropriate customer (see [alerts](operations/alerts.md)). 


# Security

#### Can I restrict cases? 
Yes it is since v2.0.0. See [Access control](operations/access_control).  

#### Can I expose IRIS on the Internet?
NO! Please don't. This platform should only be accessible in a restricted environment. 

#### I found a security issue, can I have a bounty?  
No - IRIS is free and open source so there is no bounty. Please [report](mailto:contact@dfir-iris.org>) it as soon as possible so we can fix it. 


# MISC

#### What does IRIS stand for?
Originally Incident Response Investigation System. But it can be whatever you want really. 