#
# author: Serafim Simonov <serafim.simonov@email.uni-kiel.de>
#
# File that indicates how to instrument a given function call, what to gather, etc.
#

from opentelemetry import trace
from javaMapping import signature

# Create a OTel tracer
tracer = trace.get_tracer(__name__)

def instrument(func):
    attributes = { "ess": 0}
    def instrument_func(*args, **kwargs):
        with tracer.start_as_current_span("OTelSpan", attributes=attributes) as foo:
            foo.set_attribute("operation_signature", signature(func)) # We use the Python signature mapped as Java's fully qualified signature
            foo.set_attribute("session_id", "<no-session-id>")  # session_id is only relevant with Kieker agent on Java applications
            foo.set_attribute("hostname", "localhost") # Target application should provide hostname.
            result = func(*args, **kwargs)

            return result
    return instrument_func