make: 
	cd docs/api_reference/reference; npm ci; npm run build
	cp docs/api_reference/reference/_static/* docs/_static
	mkdocs build
