#
# This project uses a multi-module maven structure
#
# This script procudes a runnable Otkt generator jar.
# The build distribution is available under:
# kieker.otel.translation.parent/kieker.otel.translation.generator/target

#!/bin/bash

cd kieker.otel.translation.parent

mvn clean install

cd kieker.otel.translation.generator

mvn package

cd ../..