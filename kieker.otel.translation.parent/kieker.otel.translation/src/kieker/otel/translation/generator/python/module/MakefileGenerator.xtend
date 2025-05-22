package kieker.otel.translation.generator.python.module

import kieker.otel.translation.generator.python.IPythonGenerator

class MakefileGenerator implements IPythonGenerator{
	override generate() {
    ".PHONY: all install build clean\n"
    + "\n"
    + "all: install build\n"
    + "\n"
    + "install:\n"
    + "\t" + "pip install .\n"
    + "\n"
    + "build:\n"
    + "\t" + "cd collector && mvn clean package\n"
    + "\n"
    + "clean:\n"
    + "\t" + "pip uninstall otkt\n"
    + "\t" + "cd collector && mvn clean\n"
	}
}
