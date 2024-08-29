# Module IRIS Seika.io 

!!! tip "*Introduced in IRIS v2.4.11*"

!!! warning
    This module is installed but not registered by default. To register it, head to the `Advanced` > `Modules` > `Add module` and input `iris_seika_module`.  

    
This module offers an interface with Seika and IRIS to automatically enrich IOCs with Seika.io insight.   
The source code is available [here](https://github.com/dfir-iris/iris-seika-module). It is installed by default but needs to be configured to be enabled.  

## Features
Two types of enrichment mechanism are proposed : 

- **Manual** : right-click on one or more IOCs and select ``Get Seika insight``. This sends the targets IOCs to the module and insights will be fetched and applied. 
- **Automatic**:
    - On create : This automatically fetch Seika insight for newly created IOC 
    - On update : This automatically  fetch Seika insight upon updates of an IOC 

The following types of IOCs are handled by the module : 

- [x] ip-\*


The insight request on an IOC not handled is simply ignored.  

Two types of insights are proposed : 

- **tags** : The module adds the following tags depending on the results of the Seika analysis:
    - ``seika:friendly`` : the IOC is known to be friendly
    - ``seika:scan`` : the IOC has been seen executing scans
    - ``seika:exploit`` : the IOC has been seen exploiting vulnerabilities
    - ``seika:bruteforce`` : the ioct has been seen bruteforcing
- **new attribute** : This adds a new attribute to the IOC with the Seika insight. It is based on a configurable template.   


## Configuration 
The behavior of the module can be configured as needed. Head to the `Advanced` > `Modules` > `IrisSeika` to change it.   

- **Seika API Key** : API key used by the module to connect to Seika. Obtain it at [Seika.io](https://seika.io) 
- **Manual triggers on IOCs** : Provides a right-click menu option on IOCs to trigger the Seika module on selected elements. 
- **Triggers automatically on IOC create**: If set to true, the module runs each time an IOC is created. Disabled by default. 
- **Triggers automatically on IOC update**: If set to true, the module runs each time an IOC is updated. Disabled by default. 
- **Assign ASN tag to IP** : If set to true, assigns the country code to the target IP IOC.
- **Add Seika report as new IOC attribute**: Creates a new attribute on the IOC, base on the Seika report. Templates define on this configuration are used. 
- **IP report template**: Jinja2 report template for IP IOCs. Refers to the raw report to assess which fields are available. 

### Seika API Key

The Seika API key is obtained from the Seika.io website. It is used to authenticate the module to the Seika API.