# Changelog

For upgrades instructions, please see the [Upgrades page](/operations/upgrades). 

## [v2.4.24](https://github.com/dfir-iris/iris-web/releases/tag/v2.4.24) <small>_ November 4, 2025 _</small>
### What's changed

- Fixes permissions check ordering allowing to have restricted groups with alerts access only
- Fixes GHSA-qhqj-8qw6-wp8v

**Full Changelog**: https://github.com/dfir-iris/iris-web/compare/v2.4.23...v2.4.24

## [v2.4.23](https://github.com/dfir-iris/iris-web/releases/tag/v2.4.23) <small>_ November 4, 2025 _</small>
### What's changed

- Fixes hooks in comment 
- Adds not_like operator in alerts filtering 
- Updates webhooks module to v1.0.9 

**Full Changelog**: https://github.com/dfir-iris/iris-web/compare/v2.4.22...v2.4.23

## [v2.4.22](https://github.com/dfir-iris/iris-web/releases/tag/v2.4.22) <small>_ June 3, 2025 _</small>
### What's changed

- Fixes issues with notes not being created

**Full Changelog**: https://github.com/dfir-iris/iris-web/compare/v2.4.21...v2.4.22

## [v2.4.21](https://github.com/dfir-iris/iris-web/releases/tag/v2.4.21) <small>_ May 21, 2025 _</small>
### What's changed

- Fixes the by-default `latest` tag pulling in .env.model 
- Fixes duplicated import of assets from alerts 


**Full Changelog**: https://github.com/dfir-iris/iris-web/compare/v2.4.20...v2.4.21

## [v2.4.20](https://github.com/dfir-iris/iris-web/releases/tag/v2.4.20) <small>_ January 15, 2025 _</small>
### What's changed

* Fixes an issue with alerts correlation that increases creation delay as more and more alerts are added to the system.

!!!  warning "Warning"
    An issue has been identified when pulling the last version of IRIS. Even after checkout to `v2.4.20`, the version `v2.5.0-beta` would be downloaded. This is due to an automatic tagging of Github Registry and an environment variable set by default to `latest` in the `.env`. See [our annoucement](https://discord.com/channels/922879298786975774/972048132504432660/1370407855596765296)

## [v2.4.19](https://github.com/dfir-iris/iris-web/releases/tag/v2.4.19) <small>_ December 21, 2024 _</small>
### What's changed

* Issue with `and_` conditions in alerts [#656](https://github.com/dfir-iris/iris-web/pull/656)
* Issue when logging out in local auth mode.

## [v2.4.17](https://github.com/dfir-iris/iris-web/releases/tag/v2.4.17) <small>_ December 9, 2024 _</small>
### What's changed

* Upgraded `psycopg2` to the latest version to avoid the issue "SCRAM authentication" by @rios0rios0 in [#637](https://github.com/dfir-iris/iris-web/pull/637)
* Added `severity_id` for creating cases by @Vladimir-A in [#653](https://github.com/dfir-iris/iris-web/pull/653)
* Fixed OIDC login issue.
* Added filtering options in the timeline.

## [v2.4.16](https://github.com/dfir-iris/iris-web/releases/tag/v2.4.16) <small>_ November 9, 2024 _</small>
### What's changed

* Fixes an issue preventing to use hybrid mode with OIDC / Local when MFA is enabled

## [v2.4.15](https://github.com/dfir-iris/iris-web/releases/tag/v2.4.15) <small>_ November 9, 2024 _</small>
### What's changed

* Fixes memory issues in alerts leading to memory exhaustion
* Adds filter fir alert source ref 
* Adds new relations in alerts for future use 
* Better UI for comments indicators 


## [v2.4.14](https://github.com/dfir-iris/iris-web/releases/tag/v2.4.14) <small>_ October 1st, 2024 _</small>
### What's changed

* Fixes error when deleting a case with notes revisions
* Fixes alerts similarities associated with alternate customers 
* Improves alerts graph by adding more info at a glance 
* Adds additional filters on alerts 

## [v2.4.13](https://github.com/dfir-iris/iris-web/releases/tag/v2.4.13) <small>_ September 14, 2024 _</small>
### What's changed

* Add OIDC in beta 
* Fix broken merge of alerts in assets 
* Fix alerts and customers checks


## [v2.4.12](https://github.com/dfir-iris/iris-web/releases/tag/v2.4.12) <small>_ August 28, 2024 _</small>
### What's changed

* Added module to support Seika.io
* Improved IRIS Webhook module
* Fixed spelling in editors 

[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v2.4.11...v2.4.12)

## [v2.4.10](https://github.com/dfir-iris/iris-web/releases/tag/v2.4.10) <small>_ July 29, 2024 _</small>
### What's changed

**Fixed**    
* Issue with errornous outcome setting in cases

[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v2.4.9...v2.4.10)


## [v2.4.9](https://github.com/dfir-iris/iris-web/releases/tag/v2.4.9) <small>_ July 17, 2024 _</small>
### What's changed

**Fixed**    
* Issue with notes revisions assigning wrong user to the revision

[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v2.4.8...v2.4.9)

## [v2.4.8](https://github.com/dfir-iris/iris-web/releases/tag/v2.4.8) <small>_ July 16, 2024 _</small>
### What's changed

**Added**
* Publication of the docker images on Github Container Registry (GHCR)
* New GraphQL API endpoints for IOCs and cases 
* Automatic load of alerts relations
* Notes revisions history

**Fixed**    
* Mutliple issues 

[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v2.4.7...v2.4.8)


## [v2.4.7](https://github.com/dfir-iris/iris-web/releases/tag/v2.4.7) <small>_ March 18, 2024 _</small>
### What's changed

**Fixed**    
* Issues in the datastore preventing to upload multiple files 

[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v2.4.6...v2.4.7)

## [v2.4.6](https://github.com/dfir-iris/iris-web/releases/tag/v2.4.6) <small>_ March 18, 2024 _</small>
### What's changed
⚠️ Important changes are done in the Access Control. If you are upgrading, please carefully read the upgrades instructions. 
The layout of the reports has been changed. Reports template need to be upgraded as well. 

**Improved**   

* New notes layout 
* New timeline layout with tree view 
* New timeline feature allowing to create child events 
* New access control feature allowing to associate users with customers 
* CI/CD init by @c8y3 in [#401](https://github.com/dfir-iris/iris-web/pull/401), [#400](https://github.com/dfir-iris/iris-web/pull/400), [#402](https://github.com/dfir-iris/iris-web/pull/402)

**Fixed**    

* Fix CSS issue by @whikernel in [#377](https://github.com/dfir-iris/iris-web/pull/377)
* Fixes addition of case templates in [#379](https://github.com/dfir-iris/iris-web/pull/379)
* Fix issues with case templates usage in [#381](https://github.com/dfir-iris/iris-web/pull/381)
* Fix issue with IOC lookups in the timeline in [#382](https://github.com/dfir-iris/iris-web/pull/382)
* Fix major collaboration issue in notes in [#385](https://github.com/dfir-iris/iris-web/pull/385)
* Fix PG Extension not being setup properly  in [#390](https://github.com/dfir-iris/iris-web/pull/390)
* Fix multiple security issues impacting case reports and editors

## New Contributors
* @MikaelFangel made their first contribution in [#414](https://github.com/dfir-iris/iris-web/pull/414)

[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v2.4.5...v2.4.6)

## [v2.3.7](https://github.com/dfir-iris/iris-web/releases/tag/v2.3.7) <small>_ December 14, 2023 _</small>
### What's Changed

**Fixed**  

* Fixes an issue with download of files from the datastore #347
* Fixes an issue with the addition of protagonist in cases
* Fixes an issue with case edition modal
    
**Improved**

* Improved timeline rendering
* Improved security in Datatables



[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v2.3.6...v2.3.7)


## [v2.3.6](https://github.com/dfir-iris/iris-web/releases/tag/v2.3.6) <small>_ December 7, 2023 _</small>
### What's Changed

**Fixed**  

* Fixes an error preventing the proper generation of reports 
* Fixes an issue with filtering in the overview tab 
* Adds more filtering options in the overview tab 


[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v2.3.5...v2.3.6)

## [v2.3.5](https://github.com/dfir-iris/iris-web/releases/tag/v2.3.5) <small>_ November 30, 2023 _</small>
### What's Changed

**Fixed**  

* Fixes an issue introduced in v2.3.4 where the cases metadata are not properly saved. 


[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v2.3.4...v2.3.5)

## [v2.3.4](https://github.com/dfir-iris/iris-web/releases/tag/v2.3.4) <small>_ November 29, 2023 _</small>

**A severe bug has been introduced in this version. Please upgarde to v2.3.5.**
### What's Changed

**Added**

* Added support for evidences types
* Added support for cases severity
* Improved search in context switcher

**Fixed**  

* Fixed overview page
* Fixed dashboard filtering


❗ The layout of the reporting has slightly changed. Custom report templates might not work anymore.
You can use `https://<server>/case/export?cid=<case_id>` to get all the possible fields.

[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v2.3.3...v2.3.4)



## [v2.3.3](https://github.com/dfir-iris/iris-web/releases/tag/v2.3.3) <small>_ October 5, 2023 _</small>
### What's Changed

**Fixed**

* Fixed breaking of manage case list if percentage in title 
* Fixed broken title search in overview 
* Fixed sorting of owners in overview 
* Fixed quick look in overview 
* Fixed alert page breaking if username contains trailing space 
* Fixed IrisVTModule links
* Fixed IrisWebhookModule 
* Fixed refresh after closing of notes 

@Scriptception made their first contribution in [313](https://github.com/dfir-iris/iris-web/pull/313)

[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v2.3.2...v2.3.3)


## [v2.3.2](https://github.com/dfir-iris/iris-web/releases/tag/v2.3.2) <small>_ August 2, 2023 _</small>
## What's Changed

**Fixed**

Patches a critical issue corrupting files uploaded to the DataStore via the IOC option or when a password is set 


[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v2.3.1...v2.3.2)

## [v2.3.1](https://github.com/dfir-iris/iris-web/releases/tag/v2.3.1) <small>_ July 23, 2023 _</small>
### What's Changed

**Improved**

- Overview page and quick view layout
- Auto assignment of alerts when not assigned 
- Possibility to filter tags by clicking on them in alerts

**Fixed**

- Call of modules when done from the modals
- UI

[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v2.3.0...v2.3.1)


## [v2.3.0](https://github.com/dfir-iris/iris-web/releases/tag/v2.3.0) <small>_ July 09, 2023 _</small>
### What's Changed

**Added**

- Collaborative editor in notes 
- Possibility to add case peer-reviews 
- Alerts resolution status
- Auto closing of alerts with resolution for linked alerts
- New webhook module
- Enhanced overview page
- Attributed open cases in dashboard
- Assets and IOCs multi-additions from the UI
- New UI design

**Fixed**

- Password change for users
- Description breaking in alerts and events
- Missing icons in MD rendering for know links
- Alerts rendering

[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v2.2.3...v2.3.0)

## [v2.2.3](https://github.com/dfir-iris/iris-web/releases/tag/v2.2.3) <small>_ June 19, 2023 _</small>
### What's Changed


**Added**

- Possibility to use LDAP and local auth as fallback 
- Possibility to add multiple IOCs at once from the UI 
- Possibility to add multiple assets at once from the UI 
- Support for hooks and module calls in alerts 
- URL redirection after login 

**Fixed**

- Similarities in alerts when no assets are provided
- Assertion of data in marshmallow
- MD editor new lines handling
- Unicode in datastore
- Alerts share links 
- Modules info when registering a module
- UI fixes

[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v2.2.2...v2.2.3)

## [v2.2.2](https://github.com/dfir-iris/iris-web/releases/tag/v2.2.2) <small>_ May 30, 2023 _</small>
### What's Changed

**Added**

- Possibility to pivot on assets and IOCs from the alerts graph

**Fixed**
- Delete character escaping for passwords by @juadde in [#253](https://github.com/dfir-iris/iris-web/pull/253)
- Case template of tasks without tags 
- Shortening of case names during updates 
- Bad handling of certain requests without CID
- Deletion of assets related to alerts once merge into a case 

[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v2.2.1...v2.2.2)

## [v2.2.1](https://github.com/dfir-iris/iris-web/releases/tag/v2.2.1) <small>_ May 24, 2023 _</small>
## What's Changed

**Note 1**: This version contains a security fix for iris-web (see [CVE-2023-30615](/security-advisories/#cve-2021-32737-may-24-2023))    
**Note 2**: `on_postload_case_info_update` hook has been renamed to `on_postload_case_update` 

**Added**

* Add newly created users after a LDAP authentication to group Analysts by @c8y3 in [#247](https://github.com/dfir-iris/iris-web/pull/247)

**Fixed**

* Security fix of CVE-2023-30615 - [GHSA-gc6j-6276-2m49](https://github.com/dfir-iris/iris-web/security/advisories/GHSA-gc6j-6276-2m49) impacting iris-web < v2.2.1
* Deletion of cases with assigned tasks 
* Merge of multiple alerts 
* Import of IOCs and Assets in case multiple alerts are merged 


[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v2.2.0...v2.2.1) 

## [v2.2.0](https://github.com/dfir-iris/iris-web/releases/tag/v2.2.0) <small>_ May 22, 2023 _</small>
### What's Changed
**Added**   

* Basic csv events file import (with default options) by @realsec in [#240](https://github.com/dfir-iris/iris-web/pull/240)
* New endpoints to search for manageable objects such as assets types etc, 
* New search by asset IDs, IOC IDs and events IDs in the timeline

**Fixes**   

* Some configuration checks when LDAP and automatic user creation are set by @c8y3 in [#246](https://github.com/dfir-iris/iris-web/pull/246)
* Ensure database connectivity before trying to create tables by @weslambert in [#248](https://github.com/dfir-iris/iris-web/pull/248)
* Merge of multiple alerts in one case not merging the IOCs and assets
* Bug allowing to add an asset to a timeline not belonging to the same case 
* UI bug fixes


**New Contributors**   

* @realsec made their first contribution in [#240](https://github.com/dfir-iris/iris-web/pull/240)
* @weslambert made their first contribution in [#248](https://github.com/dfir-iris/iris-web/pull/248)

[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v2.1.0...v2.2.0)


## [v2.1.0](https://github.com/dfir-iris/iris-web/releases/tag/v2.1.0) <small>_ May 15, 2023 _</small> 
**If you are using custom SSL certificates, please read the [upgrade instructions](https://docs.dfir-iris.org/operations/upgrades/#v210) when upgrading from previous versions.**  

### What's Changed
**Added**    

* Full support of alerts 
* Case templates 
* Provisioning of users 
* Service accounts 
* New permissions 

**Fixed**  

* Variable LDAP_AUTHENTICATION_TYPE in .env.model by @c8y3 in [#217](https://github.com/dfir-iris/iris-web/pull/217)
* Automatic creation of users with ldap authentication by @c8y3 in [#227](https://github.com/dfir-iris/iris-web/pull/227)
* Update nginx.conf for Security HTTP headers to work. by @oikuda in [#216](https://github.com/dfir-iris/iris-web/pull/216)
* Columns in manage cases [#205](https://github.com/dfir-iris/iris-web/issues/205)
* Customer contact deletion [#239](https://github.com/dfir-iris/iris-web/issues/239)
* Search permissions [#237](https://github.com/dfir-iris/iris-web/issues/237)
* Customer permissions [#235](https://github.com/dfir-iris/iris-web/issues/235)
* Toast split [#226](https://github.com/dfir-iris/iris-web/issues/226)
* Assets exporting [#224](https://github.com/dfir-iris/iris-web/issues/224)
* Assets IOC filtering [#223](https://github.com/dfir-iris/iris-web/issues/223)
* ADM username not enforced [#218](https://github.com/dfir-iris/iris-web/issues/218)
* JIT provisioning of users in LDAP [#203](https://github.com/dfir-iris/iris-web/issues/203)


**New Contributors**   

* @c8y3 made their first contribution in [#217](https://github.com/dfir-iris/iris-web/pull/217)
* @oikuda made their first contribution in [#216](https://github.com/dfir-iris/iris-web/pull/216)

[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v2.0.2...v2.1.0)


## [v2.0.2](https://github.com/dfir-iris/iris-web/releases/tag/v2.0.2) <small>_ April 18, 2023 _</small> 
### What's Changed
**Fixed**   
* Update case_notes_db.py for bug fix #200 by @LoneWolf-96 in [#208](https://github.com/dfir-iris/iris-web/pull/208)
* Do not escape_filter_chars for NTLM username by @juadde in [#212](https://github.com/dfir-iris/iris-web/pull/212)
* docker-compose cleanup by @juadde in [#213](https://github.com/dfir-iris/iris-web/pull/213)
* Listening port not being propagated in nginx docker 

**New Contributors**    
* @LoneWolf-96 made their first contribution in [#208](https://github.com/dfir-iris/iris-web/pull/208)
* @juadde made their first contribution in [#212](https://github.com/dfir-iris/iris-web/pull/212)

[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v2.0.1...v2.0.2)

## [v2.0.1](https://github.com/dfir-iris/iris-web/releases/tag/v2.0.1) <small>_ April 05, 2023 _</small> 

### What's Changed

**Fixed**
[FIX] Additional table header in case management breaking proper loading of data in [#206](https://github.com/dfir-iris/iris-web/pull/206)


[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v2.0.0...v2.0.1)

## [v2.0.0](https://github.com/dfir-iris/iris-web/releases/tag/v2.0.0) <small>_ March 26, 2023 _</small> 

### What's Changed

In addition to the features listed below, we are changing the way we are issuing releases. From now on, IRIS follows the [Semantic Versioning 2.0](https://semver.org/) guidelines.   
The code ready for production is always tagged with a version number. 
``alpha`` and ``beta`` versions are **not** production-ready.   

Do not use the ``master`` branch in production.  

A website with the current development version is also provided and freely accessible. It serves as a beta before public releases.   

**Added** 

* Groups management 
* Case access control and basic permissions
* Comments support on a call objects
* Markdown editors in all case objects 
* Customers dedicated pages with additional information and cases stats 
* LDAP authentication 
* Markdown reporting
* Case owners, classifications, outcome and tags
* Possibility to update case basic infornations 
* Case overview page 
* Unique UUID on all case objects 
* Multiple assignees support in case tasks 
* Deletion confirmation prompt on all case objects as an option
* IOC in events plus optional synchronization with assets
* Events flagging in the timeline
* MD links on every case objects

**Improved**

* Dark mode
* Uniformity of modals
* Overall UI and UX 
* Compromised status in assets 
* Error reporting in the UI 

**Fixed** 

* Manual call of modules when multiple modules are availables 
* Multiples bugs fixes 
* Security fixes 

[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v1.4.5...v2.0.0)  

## [v1.4.5](https://github.com/dfir-iris/iris-web/releases/tag/v1.4.4) <small>_ June 9, 2022 _</small> 

**What's Changed**

* Added a datastore in [#115](https://github.com/dfir-iris/iris-web/pull/115), fixes [#30](https://github.com/dfir-iris/iris-web/issues/30) : 
    * Upload and store any files on IRIS 
    * Password protect them as an option 
    * Download
    * Add to IOC and/or evidences automatically 
    * Reference to files in notes, summary or any textual input 
    * Copy/paste of images directly in notes and summary 
    * Virtual folders to arrange files
* Ability to configure password policy in [#117](https://github.com/dfir-iris/iris-web/pull/117), fixes [#116](https://github.com/dfir-iris/iris-web/issues/116)
* Dark mode improved, flickering removed 
* Multiples bugs fixes 
* Security fixes 

[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v1.4.4...v1.4.5)  

**Notes**: Changes are made to the Nginx docker to allow upload of big files, hence specific upgrades are needed and auto-updates is not yet supported for this version. Please see the [upgrades instruction](https://docs.dfir-iris.org/operations/upgrades/#v145) for more details. 

## [v1.4.4](https://github.com/dfir-iris/iris-web/releases/tag/v1.4.4) <small>_ May 18, 2022 _</small> 

**What's Changed**

- Implementation of bulk events editing by @sebastiandemmer in [#110](https://github.com/dfir-iris/iris-web/pull/110)
- Fixes context switch button doesn't load cases by @DevJoost in [#112](https://github.com/dfir-iris/iris-web/pull/112)
- Fixes multiple minor bugs 

[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v1.4.3...v1.4.4)


## [v1.4.3](https://github.com/dfir-iris/iris-web/releases/tag/v1.4.3) <small>_ May 13, 2022 _</small> 

**What's changed**

- Managed IRIS updates from itself
- Custom icons for assets - fixes [#44](https://github.com/dfir-iris/iris-web/issues/44) by @sebastiandemmer
- IOCs link in timeline and graph - fixes [#50](https://github.com/dfir-iris/iris-web/issues/50) 
- History of modifications in timeline
- User id in timeline export as an option - fixes [#65](https://github.com/dfir-iris/iris-web/issues/65) 
- Backup of database from the interface 
- Minimisation of modals in cases 
- New UI improvements in timeline 
- New minimal notifications for almost all activities
- Improved overall responsiveness and speed 
- Improved error feedbacks to users
- Improved load of tasks results by x10
- Code cleaning
- Multiple bug fixes

[Full Changelog](https://github.com/dfir-iris/iris-web/compare/v1.4.2...v1.4.3)

## [v1.4.2](https://github.com/dfir-iris/iris-web/releases/tag/v1.4.2) <small>_ April 22, 2022 _</small> 

**Improvements** :   

* Possibility to duplicates events in timeline - [#91](https://github.com/dfir-iris/iris-web/pull/91)  
* Possibility to filter timeline with basic query - [#94](https://github.com/dfir-iris/iris-web/issues/94)   

**Fixes** :   

* Integer limit on file size in evidences - [#89](https://github.com/dfir-iris/iris-web/issues/89)  
* Gradient in closed cases   
* on-preload hooks list handling - [#92](https://github.com/dfir-iris/iris-web/issues/92)   
* tags issue - [#88](https://github.com/dfir-iris/iris-web/pull/88)   
* Case info modal from case - [#93](https://github.com/dfir-iris/iris-web/issues/93)   
* Multiple UI issues   

## [v1.4.1](https://github.com/dfir-iris/iris-web/releases/tag/v1.4.1) <small>_ April 8, 2022 _</small> 
 
* Fixes a [scrolling issue](https://github.com/dfir-iris/iris-web/pull/86) of the timeline when events are being popped 

## [v1.4.0](https://github.com/dfir-iris/iris-web/releases/tag/v1.4.0) <small>_ April 6, 2022 _</small> 
*A bug fixe exists for this version. See v1.4.3* 

* Hooks, adding the ability for modules to react on almost anything happening on the plateform in [#75](https://github.com/dfir-iris/iris-web/pull/75)
* New type of modules that can handles hooks 
* VirusTotal beta integration as a processor module 
* MISP beta integration as a processor module 
* Custom attributes on all case objects allowing to extend the default fields 
* A compact timeline view for better visbility 
* Premises of a dark theme
* Resiliency of docker volume in [#80](https://github.com/dfir-iris/iris-web/pull/80)
* Minor improvements in [#69](https://github.com/dfir-iris/iris-web/pull/69), [#79](https://github.com/dfir-iris/iris-web/pull/79)
* Bug fixes in [#70](https://github.com/dfir-iris/iris-web/pull/70), [#73](https://github.com/dfir-iris/iris-web/pull/73), [#77](https://github.com/dfir-iris/iris-web/pull/77)
* Security fixes 


## [v1.3.1](https://github.com/dfir-iris/iris-web/releases/tag/v1.3.1) <small>_ March 19, 2022 _</small> 

- Fixes wheel issue preventing proper build of the docker, as described in [#83](https://github.com/dfir-iris/iris-web/pull/83)

## [v1.3.0](https://github.com/dfir-iris/iris-web/releases/tag/v1.3.0) <small>_ January 24, 2022 _</small> 

* Added the ability to batch upload IOC from a CSV file in  [#26](https://github.com/dfir-iris/iris-web/pull/26)
* Added the ability to batch upload assets from a CSV
* Screenshot - Export contents of any case pages as PNG in [#35](https://github.com/dfir-iris/iris-web/pull/35)
* Export timeline as CSV in [#47](https://github.com/dfir-iris/iris-web/pull/47)
* Improved timeline loading time by x10 - loads thousands of events in a sec 
* New auto parsing of dates in events addition/updates
* Brand new timeline visualisations 
* Improved assets loading time 
* Shared links - easily share any case objects with your collaborators
* Right panel now offers last activities for user's current case
* Added assets tags in [#37](https://github.com/dfir-iris/iris-web/pull/37)
* New API endpoints in [#53](https://github.com/dfir-iris/iris-web/pull/53)
* Auto migration of database for next releases
* Indication of mandatory fields in forms 
* General bug fixes, stability and UI improvement 

## [v1.2.1](https://github.com/dfir-iris/iris-web/releases/tag/v1.2.1) <small>_ December 31, 2021 _</small> 

* Added ATT&CK tactics by @ecapuano in [#9](https://github.com/dfir-iris/iris-web/pull/9)
* Added screenshot and video link in readme in [#12](https://github.com/dfir-iris/iris-web/pull/12)
* Fixed duplicated path to add customer in [#4](https://github.com/dfir-iris/iris-web/pull/4)
* Fixed asset description data validation client side in [#7](https://github.com/dfir-iris/iris-web/pull/7)
* Fixed tooltip in [#10](https://github.com/dfir-iris/iris-web/pull/10)
* Add a per-column filtering field in the case view by in [#15](https://github.com/dfir-iris/iris-web/pull/15)