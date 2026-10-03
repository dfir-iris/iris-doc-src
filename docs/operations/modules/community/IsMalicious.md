# IsMalicious IOC enrichment

[iris-ismalicious-module](https://github.com/hexablob/iris-ismalicious-module)
is an optional community processor maintained separately from IRIS. It adds
reputation context to an IOC through a manual action. It is not installed or
registered by default.

Supported IOC types are `ip-src`, `ip-dst` (IPv4/IPv6), `domain`, `hostname`,
`url`, `md5`, `sha1` and `sha256`. The processor adds an **IsMalicious** custom
attribute tab with a summary and the full JSON response. It leaves existing
analyst tags, descriptions, severity and other attribute tabs unchanged.

## Compatibility

Version `0.1.0` targets the `iris_interface` **1.2.0** contract used by IRIS
**v2.4.29**. Its tests exercise that real interface with isolated application
and database dependencies. A complete IRIS deployment and an authenticated
production IsMalicious response have not been tested. Validate the module in
a staging instance before deployment.

The IRIS v3 backend currently retains the same interface in source, but full
v3 runtime compatibility is unverified. This guide does not propose a bundled
module or a change to IRIS's default processors.

## Installation and configuration

Build the versioned wheel:

```sh
git clone --branch v0.1.0 https://github.com/hexablob/iris-ismalicious-module.git
cd iris-ismalicious-module
python -m pip install build
python -m build --wheel
```

Install `dist/iris_ismalicious_module-0.1.0-py3-none-any.whl` in the Python
environments of both the **IRIS web application and worker**, then restart
both services. Include it in your deployment images so rebuilds retain the
module. Do not replace the `iris_interface` package supplied by IRIS.

In **Advanced > Modules**, add `iris_ismalicious_module`, enable it, and
configure these fields:

| Field | Value |
| --- | --- |
| IsMalicious API credential | Base64 of `apiKey:apiSecret`, not the API key alone |
| Manual IOC enrichment | Enabled to offer the manual action |

Obtain your own [IsMalicious account and key/secret pair](https://ismalicious.com/app/account).
The credential is held in a `sensitive_string` configuration field and sent
as `X-API-KEY`. Module installation and configuration require an IRIS
administrator. See [module management](../mod_management.md) for IRIS's module
registration workflow.

## Enrich an IOC

Select a supported IOC and run **Get IsMalicious insight** from its manual
actions. The processor registers only `on_manual_trigger_ioc`, so importing
or updating IOCs does not send background requests. Each lookup consumes one
request under the account's API quota. Standard API enrichment is used; the
module does not consume or redistribute TAXII feeds.

Read `evidence.verdict`, reasons, contradictory signals and provenance in the
raw report before acting. Risk score and confidence are separate. A false
`malicious` flag is not proof of safety. Unknown hashes stay unknown even with
a score of zero; contextual source rows are not a count of positive detections.
Missing optional confidence is not replaced by a default value.

The summary escapes upstream text, and the full JSON uses the static `raw`
attribute type. It does not place untrusted JSON into executable HTML.

## Failed lookups

The processor uses TLS verification, a 30-second timeout, no redirects and no
automatic retries. Authentication, quota/rate-limit, server, timeout and
invalid-response errors appear in the module diagnostics. A failed lookup
leaves any previous IsMalicious report on that IOC untouched. A manual batch
can have partial results: successful enrichments can be saved while failed
lookups are reported.

For API details and optional response fields, see the
[IsMalicious API reference](https://ismalicious.com/api-docs). For module bugs,
use the [community module issue tracker](https://github.com/hexablob/iris-ismalicious-module/issues).
