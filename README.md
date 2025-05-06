OpenTelemetry for Kieker Translator domain-pecific language (Otkt DSL)
Authors
Serafim Simonov serafim.simonov@email.uni-kiel.de
Dr. Shinhyung Yang shinhyung.yang@email.uni-kiel.de
About
Kieker observability framework features monitoring and analysis capabilities. OpenTelemetry, in comparison, provides means to monitor the program but no analysis. Otkt DSL can define a mapping from an OpenTelemetry Span to a Kieker record. Using Otkt, we can use OpenTelemetry to collect monitoring data from a Python program and send it to a Kieker Analysis endpoint.

Build from Eclipse IDE
This was developped using the Eclipse IDE for Java and DSL Developpers.

Build Main Project
Import the project into the Eclipse IDE with Maven: Import... > Maven > Existing Maven Projects

Select the root directory (kieker.otel.translation.parent) and let it scan.

In the file tree viewer, right click on kieker.otel.translation.parent.

Select Run As then Maven install and let it build.

Run Main Project
Still in the file tree viewver, right click on kieker.otel.translation.generation.Main.

Select Run As then Java Application and let it run.

Export Main Project
In the file tree viewver, right click on kieker.otel.translation.generation.Main.

Select Import... > Java > Runnable Jar File.

Select the export location and tick Package required libraires into generated JAR.

Multiple attempts may be necessary.

Potential issues
Using windows WSL, the build will fail if you import the project from the WSL file system but use the Eclipse IDE installed on the windows file system. One possible fix is to install the Git IDE and clone the project directly into the Windows file system. Now that the two elements are on the same "level", things should work as intented.

It may be necessary to add the kieker.otel.translation/target/classes folder to the classpath of the project: right click on the projet > Properties > Java Build Path > open the Libraries tab > click on ClassPath in the tree viewver > Add Class Folder.
