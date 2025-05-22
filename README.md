# OpenTelemetry for Kieker Translator domain-specific language (Otkt DSL)

![Otkt logo](docs/img/otkt_logo.svg)

## Authors

- Serafim Simonov, M.Sc. <simonovserafim@gmail.com>
- Daphné Larrivain <daphne.larrivain@ecole.ensicaen.fr>
- Dr. Shinhyung Yang <shinhyung.yang@email.uni-kiel.de>

## About

The Kieker observability framework features monitoring and analysis capabilities. OpenTelemetry, in comparison, provides means to monitor the program but no analysis by itself. The goal of Otkt DSL is to define a mapping from an OpenTelemetry span to a Kieker record. Using Otkt, we can use OpenTelemetry to collect monitoring data from a Python program and send it to a Kieker collector. In this repository you will find the Otkt compiler.

## Build


Run the following:
```
cd kieker.otel.translation.parent
./mvnw -P generator
```
The built runnable jar is [here](kieker.otel.translation.parent/kieker.otel.translation.generator/target).

## Run

```
java -jar <name-of-the-runnable-jar>.jar <path/to/input.otkt> <path/to/output/folder>
```

## Clean

```
cd kieker.otel.translation.parent
./mvnw clean
```

## Examples

- [Instrumentation Examples](https://github.com/Misrobody/OtktDSL-examples)
- [OtktSurvey](https://github.com/Misrobody/OtktSurvey)
- [Sustain Kieker Hackathon](https://github.com/kieker-monitoring/SustainKiekerHackathon)

## Documentation

- [Building the compiler within the Eclipse IDE](docs/BUILD-ECLIPSE.md)
- [Using the compiler](docs/BUILD.md)
- [Otkt Tutorial](docs/OTKT-TUTORIAL.md)
- [How to Instrument a Python Application](docs/INSTRUMENT.md)
- [Technical Overview](docs/TECHNICAL-SUMMARY.md)
