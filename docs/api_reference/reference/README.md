
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

