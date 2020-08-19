snapshot:
	rm -f tests/__snapshot__/*
	make test

test:
	helm unittest .

# None of the Make tasks generate files with the name of the task, so all must be declared as 'PHONY'
.PHONY: snapshot test
