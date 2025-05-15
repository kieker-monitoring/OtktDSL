# How to Instrument a Python Application

- [Main page](../README.md)

This is, sadly, a manual process. It differs from application to application.
However, we can draw a general approach to instrumenting a Python application.

## Preparation

Manual instrumentation requires locating:
1. The file with the entry point.
2. The target Python files

Then one would need to specify how to instrument the functions themselves.

### Instrument the entry point

```python
from otkt.otelinit import tracer
```

### Instrument all Python files

Please use the provided [script](../tools/instrument.py) in the target software repository.
The latter will prepend module imports and instrument every function.

### Instrument the function

An example intrumentation has been given in [examples](../examples/).
- `instrument.py` defines the sub-routine for the function calls
- `javaMapping.py` provides a mapping of Python signatures to fully qualified Java signatures

## Run the Otkt collector

Then, run the previously built Otkt collector with the correct configuration.
An [example configuration file](../examples/config.txt) is provided.

```bash
java -jar path/to/collector/Collector-0.0.1-SNAPSHOT-jar-with-dependencies.jar -c /path/to/config/config.txt
```
## Run the app

After launching the collector, run the instrumented entry point. Kieker logs should have been created in the repository given in `config.txt`

You are then free to run a Kieker Trace Analysis as usual.

## Examples

- [Instrumentation Examples](https://github.com/Misrobody/kieker-otel-interoperability)
- [Sustain Kieker Hackathon](https://github.com/kieker-monitoring/SustainKiekerHackathon)

