# Security Advisories

We take security seriously at DFIR-IRIS. We are committed to providing a secure and reliable platform for our users. If you believe you have found a security vulnerability in any of our projects, please report it to us by sending an email to [contact@dfir-iris.org](mailto://contact@dfir-iris.org). We will investigate all legitimate reports and do our best to quickly fix the problem.   

This page lists all security advisories that have been published for the code released by DFIR-IRIS.

## [CVE-2026-22783](https://github.com/dfir-iris/iris-web/security/advisories/GHSA-qhqj-8qw6-wp8v) <small>_ Oct 22, 2025 _</small>

| CVE ID | Github ID | Severity | Impacted product |  
|--------|-----------|-----------|-------|
| [CVE-2026-22783](https://nvd.nist.gov/vuln/detail/CVE-2026-22783) | [GHSA-qhqj-8qw6-wp8v](https://github.com/dfir-iris/iris-web/security/advisories/GHSA-qhqj-8qw6-wp8v) | High - CVSS3 8.1/10 | iris-web |

### Description
Prior to 2.4.24, the DFIR-IRIS datastore file management system has a vulnerability where mass assignment of the file_local_name field combined with path trust in the delete operation enables authenticated users to delete arbitrary filesystem paths. The vulnerability manifests through a three-step attack chain: authenticated users upload a file to the datastore, update the file's file_local_name field to point to an arbitrary filesystem path through mass assignment, then trigger the delete operation which removes the target file without path validation. 

### Affected versions
- `iris-web` < `2.4.24`

### Fixed versions
- `iris-web` >= `2.4.24`

## [CVE-2024-34060](https://github.com/dfir-iris/iris-web/security/advisories/GHSA-9rw6-5q9j-82fm) <small>_ Feb 18, 2024 _</small>

| CVE ID | Github ID | Severity | Impacted product |  
|--------|-----------|-----------|-------|
| [CVE-2024-34060](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2024-34060) | [GHSA-9rw6-5q9j-82fm](https://github.com/dfir-iris/iris-web/security/advisories/GHSA-9rw6-5q9j-82fm) | High - CVSS3 4.6/10 | iris-evtx-module |

### Description
The iris-evtx-module is a pipeline plugin of iris-web that processes EVTX files through IRIS web application. During the upload of an EVTX through this pipeline, the filename is not safely handled and may cause an Arbitrary File Write. This can lead to a remote code execution (RCE) when combined with a Server Side Template Injection (SSTI).

This module is not enabled by default.

### Affected versions
- `iris-evtx-module` < `1.0.0`

### Fixed versions
- `iris-evtx-module` >= `1.0.0`

### Workarounds
Disable the module in IRIS Advanced settings. The module is not enabled by default.  

### Acknowledgment
Thanks to Dan Shallom (OP Innovate) for the responsible disclosure.  


## [CVE-2024-25640](https://github.com/dfir-iris/iris-web/security/advisories/GHSA-2xq6-qc74-w5vp) <small>_ Feb 18, 2024 _</small>

| CVE ID | Github ID | Severity | Impacted product |  
|--------|-----------|-----------|-------|
| [CVE-2024-25640](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2024-25640) | [GHSA-2xq6-qc74-w5vp](https://github.com/dfir-iris/iris-web/security/advisories/GHSA-2xq6-qc74-w5vp) | Moderate - CVSS3 4.6/10 | iris-web |

### Description
A stored Cross-Site Scripting (XSS) vulnerability has been identified in iris-web, affecting multiple locations, notably descriptions inputs, in versions prior to v2.4.0. The vulnerability may allow an attacker to inject malicious scripts into the application, which could then be executed when a user visits the affected locations. This could lead to unauthorized access, data theft, or other related malicious activities. 

An attacker need to be authenticated on the application to exploit this vulnerability. 

### Affected versions
- `iris-web` < `2.4.0`

### Fixed versions
- `iris-web` >= `2.4.0`

### Workarounds
No workarounds are available. It is recommended to upgrade to the latest version of iris-web.

### Acknowledgment
Thanks to Yehonatan Harizi (OP-C) for the responsible disclosure. 


## [CVE-2024-25624](https://github.com/dfir-iris/iris-web/security/advisories/GHSA-m64w-f7fg-hpcr) <small>_ Feb 15, 2024 _</small>

| CVE ID | Github ID | Severity | Impacted product |  
|--------|-----------|-----------|-------|
| [CVE-2024-25624](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2024-25624) | [GHSA-m64w-f7fg-hpcr](https://github.com/dfir-iris/iris-web/security/advisories/GHSA-m64w-f7fg-hpcr) | High - CVSS3 7.2/10 | iris-web |

### Description
Due to an improper setup of Jinja2 environment, reports generation in iris-web is prone to a Server Side Template Injection (SSTI). Successful exploitation of the vulnerability can lead to an arbitrary Remote Code Execution.

An authenticated administrator has to upload a crafted report template containing the payload. Upon generation of a report based on the weaponised template, any user can trigger the vulnerability.   

### Affected versions
- `iris-web` < `2.4.6`

### Fixed versions
- `iris-web` >= `2.4.6`

### Workarounds
No workaround is available. It is recommended to update as soon as possible. Until patching, review the report templates and keep the administrative privileges that include the upload of report templates limited to dedicated users.

### Acknowledgment
Thanks to Dan Shallom (OP Innovate) for the responsible disclosure.


## [CVE-2023-50712](https://github.com/dfir-iris/iris-web/security/advisories/GHSA-593r-747g-p92p) <small>_ Dec 18, 2023 _</small>

| CVE ID | Github ID | Severity | Impacted product |  
|--------|-----------|-----------|-------|
| [CVE-2023-30615](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-30615) | [GHSA-593r-747g-p92p](https://github.com/dfir-iris/iris-web/security/advisories/GHSA-593r-747g-p92p) | Moderate - CVSS3 4.6/10 | iris-web |

### Description
A stored Cross-Site Scripting (XSS) vulnerability has been identified in iris-web, affecting multiple locations in versions prior to v2.3.7. The vulnerability may allow an attacker to inject malicious scripts into the application, which could then be executed when a user visits the affected locations. This could lead to unauthorized access, data theft, or other related malicious activities.

An attacker need to be authenticated on the application to exploit this vulnerability.
### Affected versions
- `iris-web` < `2.3.7`

### Fixed versions
- `iris-web` >= `2.3.7`

### Workarounds
No workaround is available.  

### Acknowledgment
Thanks to Leonard Rapp (G DATA Advanced Analytics GmbH) for the responsible disclosure.


## [ CVE-2023-30615](https://github.com/dfir-iris/iris-web/security/advisories/GHSA-gc6j-6276-2m49) <small>_ May 24, 2023 _</small>

| CVE ID | Github ID | Severity | Impacted product |  
|--------|-----------|-----------|-------|
| [ CVE-2023-30615](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-30615) | [GHSA-gc6j-6276-2m49](https://github.com/dfir-iris/iris-web/security/advisories/GHSA-gc6j-6276-2m49) | Moderate - CVSS3 4.6/10 | iris-web |

### Description
A stored Cross-Site Scripting (XSS) vulnerability has been identified in `iris-web`, affecting multiple locations in versions prior to `v2.2.1`. The vulnerability allows an attacker to inject malicious scripts into the application, which are then executed when a user visits the affected locations. This can lead to unauthorized access, data theft, or other related malicious activities.

An attacker need to be authenticated on the application to exploit this vulnerability.


### Affected versions
- `iris-web` < `2.2.1`
-  `iris-web` > `2.0.0` and < `2.2.1` while not using the alerting feature are not impacted.

### Fixed versions
- `iris-web` >= `2.2.1`

### Workarounds
No workaround is available.

