package kieker.otel.translation.generator.python.module

import kieker.otel.translation.generator.python.IPythonGenerator

class ConfigGenerator implements IPythonGenerator{
	override generate() {
		'''       
        ## The name of the Kieker instance.
        kieker.monitoring.name=KIEKER

        ## Auto detect hostname for the writer
        kieker.monitoring.hostname=

        ## Output metadata record
        kieker.monitoring.metadata=true


        kieker.monitoring.writer=kieker.monitoring.writer.filesystem.FileWriter

        ## FileWriter settings
        ## output path


        kieker.monitoring.writer.filesystem.FileWriter.customStoragePath=/tmp


        kieker.monitoring.writer.filesystem.FileWriter.charsetName=UTF-8

        ## Number of entries per file
        kieker.monitoring.writer.filesystem.FileWriter.maxEntriesInFile=25000

        ## Limit of the log file size; -1 no limit
        kieker.monitoring.writer.filesystem.FileWriter.maxLogSize=-1

        ## Limit number of log files; -1 no limit
        kieker.monitoring.writer.filesystem.FileWriter.maxLogFiles=-1

        ## Map files are written as text files
        kieker.monitoring.writer.filesystem.FileWriter.mapFileHandler=kieker.monitoring.writer.filesystem.TextMapFileHandler

        ## Flush map file after each record
        kieker.monitoring.writer.filesystem.TextMapFileHandler.flush=true

        ## Do not compress the map file
        kieker.monitoring.writer.filesystem.TextMapFileHandler.compression=kieker.monitoring.writer.compression.NoneCompressionFilter

        ## Log file pool handler
        kieker.monitoring.writer.filesystem.FileWriter.logFilePoolHandler=kieker.monitoring.writer.filesystem.RotatingLogFilePoolHandler

        ## Text log for record data
        kieker.monitoring.writer.filesystem.FileWriter.logStreamHandler=kieker.monitoring.writer.filesystem.TextLogStreamHandler

        ## Do not compress the log file
        kieker.monitoring.writer.filesystem.TextLogStreamHandler.compression=kieker.monitoring.writer.compression.NoneCompressionFilter

        ## Flush log data after every record
        kieker.monitoring.writer.filesystem.FileWriter.flush=true

        ## buffer size. The log buffer size must be big enough to hold the biggest record
        kieker.monitoring.writer.filesystem.FileWriter.bufferSize=81920 
		'''
	}
}
