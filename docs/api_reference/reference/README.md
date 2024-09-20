# File organization and naming conventions

For a given version, the following directories may be present
* parameters: the name of the parameter is used as file name.
  * path
  * query
* resources: the name of the resource files follows the resource path (slashes are converted to underscores). The operationId should correspond to the name of the file to which with the http verb is added.
* responses: in camel cases
* schemas: in camel cases


# Generation

To generate the documentation:
```
npx @redocly/cli build-docs iris.v2.1.0.yaml
```

# File organisation

To ease maintenance, the openapi file is split in several files:
* resources are stored in `${VERSION}/schemas/${SCHEMA_NAME}.yaml`
* schemas are stored in `${VERSION}/resources/${RESOURCE_NAME}.yaml`

When a new version is introduced, only the new fragments are updated and put in the new `${VERSION}` directory.

# Some other useful commands
Preview:
```
npx @redocly/cli preview-docs iris.v2.1.0.yaml
```

Lint:
```
npx @redocly/cli lint iris.v2.1.0.yaml
```

Bundle:
```
npx @redocly/cli bundle iris.v2.1.0.yaml --output <specification.yaml>
```

