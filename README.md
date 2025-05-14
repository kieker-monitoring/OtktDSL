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

