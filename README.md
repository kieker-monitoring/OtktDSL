# OpenTelemetry for Kieker Translator domain-specific language (Otkt DSL)

## Authors

- Serafim Simonov <serafim.simonov@email.uni-kiel.de>
- Dr. Shinhyung Yang <shinhyung.yang@email.uni-kiel.de>
- Daphné Larrivain <daphne.larrivain@ecole.ensicaen.fr>

## About

The Kieker observability framework features monitoring and analysis capabilities. OpenTelemetry, in comparison, provides means to monitor the program but no analysis. Otkt DSL can define a mapping from an OpenTelemetry Span to a Kieker record. Using Otkt, we can use OpenTelemetry to collect monitoring data from a Python program and send it to a Kieker Analysis endpoint. In this repository you will find the Otkt compiler, using its own Otkt domain specific language.

## Documentation

- [Building the compiler](docs/BUILD-COMPILER.md)
- [Using the compiler](docs/BUILD.md)
- [Otkt Tutorial](docs/OTKT-TUTORIAL.md)