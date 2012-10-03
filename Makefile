TEST_DRIVER_PORT = 42442

jstd:
	@java \
		-jar jstd/jsTestDriver.jar \
		-Xmx256m \
		--port $(TEST_DRIVER_PORT)
	
test:
	@java \
		-jar jstd/jsTestDriver.jar \
		-Xmx256m \
		--server http://127.0.0.1:$(TEST_DRIVER_PORT) \
		--tests all \
		--testOutput coverage/output \
		--captureConsole
	@python \
		coverage/scripts/lcov_cobertura.py \
		coverage/output/jsTestDriver.conf-coverage.dat \
		--output coverage/coverage.xml
	
.PHONY: jstd test