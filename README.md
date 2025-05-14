# OpenTelemetry for Kieker Translator domain-specific language (Otkt DSL)

![Otkt logo](docs/img/otkt_logo.svg)

## Authors

- Serafim Simonov <serafim.simonov@email.uni-kiel.de>
- Dr. Shinhyung Yang <shinhyung.yang@email.uni-kiel.de>
- Daphné Larrivain <daphne.larrivain@ecole.ensicaen.fr>

## About

The Kieker observability framework features monitoring and analysis capabilities. OpenTelemetry, in comparison, provides means to monitor the program but no analysis. Otkt DSL can define a mapping from an OpenTelemetry Span to a Kieker record. Using Otkt, we can use OpenTelemetry to collect monitoring data from a Python program and send it to a Kieker Analysis endpoint. In this repository you will find the Otkt compiler, using its own Otkt domain specific language.

## Build

Run the following script:
```
./build.sh
```
The built runnable jar is [here](kieker.otel.translation.parent/kieker.otel.translation.generator/target).
A builds with and without dependencies are available.

## Run

```
java -jar <name-of-the-runnable-jar>.jar <path/to/input.otkt> <path/to/output/folder>
```

## Clean

```
cd kieker.otel.translation.parent
mvn clean
cd ..
```

## Documentation

- [Building the compiler within the Eclipse IDE](docs/BUILD-ECLIPSE.md)
- [Using the compiler](docs/BUILD.md)
- [Otkt Tutorial](docs/OTKT-TUTORIAL.md)
- [How to Instrument a Python Application](docs/INSTRUMENT.md)
- [Technical Overview](docs/TECHNICAL-SUMMARY.md)

=======

## About

Kieker observability framework features monitoring and analysis capabilities. OpenTelemetry, in comparison, provides means to monitor the program but no analysis. Otkt DSL can define a mapping from an OpenTelemetry Span to a Kieker record. Using Otkt, we can use OpenTelemetry to collect monitoring data from a Python program and send it to a Kieker Analysis endpoint.

## Build from Eclipse IDE

This was developped using the Eclipse IDE for Java and DSL Developpers.

### Build Main Project

1. Import the project into the Eclipse IDE with Maven: Import... > Maven > Existing Maven Projects

2. Select the root directory (`kieker.otel.translation.parent`) and let it scan.

3. In the file tree viewer, right click on `kieker.otel.translation.parent`.

4. Select `Run As` then `Maven install` and let it build.

### Run Main Project

5. Still in the file tree viewver, right click on `kieker.otel.translation.generation.Main`.

6. Select `Run As` then `Java Application` and let it run.

## Export Main Project

7. In the file tree viewver, right click on `kieker.otel.translation.generation.Main`.

8. Select Import... > Java > Runnable Jar File.

9. Select the export location and tick Package required libraires into generated JAR.

Multiple attempts may be necessary.

### Potential issues

 - Using windows WSL, the build will fail if you import the project from the WSL file system but use the Eclipse IDE installed on the windows file system. One possible fix is to install the Git IDE and clone the project directly into the Windows file system. Now that the two elements are on the same "level", things should work as intented.

 - It may be necessary to add the `kieker.otel.translation/target/classes` folder to the classpath of the project: right click on the projet > Properties > Java Build Path > open the Libraries tab > click on ClassPath in the tree viewver > Add Class Folder.
