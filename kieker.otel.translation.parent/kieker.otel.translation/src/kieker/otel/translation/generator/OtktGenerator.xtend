package kieker.otel.translation.generator

import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.AbstractGenerator
import org.eclipse.xtext.generator.IFileSystemAccess2
import org.eclipse.xtext.generator.IGeneratorContext
import kieker.otel.translation.generator.python.PythonOtelSdkGenerator
import kieker.otel.translation.otkt.Mapping
import kieker.otel.translation.otkt.OtelSpan

import kieker.otel.translation.generator.analysis.AnalysisGenerator
import kieker.otel.translation.otkt.KiekerMonitoringType
import java.util.ArrayList
import kieker.otel.translation.generator.python.PythonProcessorSdk
import kieker.otel.translation.otkt.DefaultMapping
import kieker.otel.translation.specification.KiekerRecordSpecification
import kiekerrecord.KiekerRecord
import org.eclipse.emf.common.util.EList
import java.util.List
import kieker.otel.translation.generator.python.OtelInitGenerator

import  kieker.otel.translation.generator.python.module.InstrumentGenerator
import  kieker.otel.translation.generator.python.module.JavaMappingGenerator
import  kieker.otel.translation.generator.python.module.SetupGenerator
import  kieker.otel.translation.generator.python.module.MakefileGenerator
import  kieker.otel.translation.generator.python.module.ConfigGenerator

/**
 * Generates code from your model files on save.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#code-generation
 */
class OtktGenerator extends AbstractGenerator {

		val List<mappingModel.SpanParam> globalModified = new ArrayList
		val List<mappingModel.SpanParam> parentModified = new ArrayList
		 
	override void doGenerate(Resource resource, IFileSystemAccess2 fsa, IGeneratorContext context) {

		val records = resource.allContents.filter(KiekerMonitoringType).toList()
		val otelSpan = resource.allContents.filter(OtelSpan).toList()
		val mappingList = resource.allContents.filter(Mapping).toList()

		var mappingModel = KiekerRecordSpecification.createMappingModel
		var mappingModelMappings = mappingModel.getMappings

		val globalyModifiedAttributes = new ArrayList();
		val parentlyModifiedAttributes = new ArrayList();

		// sort modified attributes into globaly and parently modified
		for (attr : otelSpan.get(0).getAttributes) {
			if (!attr.getAnnotation.getLiteral.equals("default")) {
				if (attr.getDependency.getLiteral.equals("global")) {
					globalyModifiedAttributes.add(attr)
				} else if (attr.getDependency.getLiteral.equals("parent")) {
					parentlyModifiedAttributes.add(attr)
				}
			}
		}

		// sort modified attributes into globaly and parently 
		// into default mappings
		for (mapping : mappingList) {
			if (mapping instanceof DefaultMapping) {
				val kiekerRecord = mapping.getTo
				this.extractGlobalOrParentlyAttributes(kiekerRecord, mappingModelMappings)

			}
		}

		// PYTHON /////////////////////////////////////////////////////////////////////////

		// instantiate generators
		// instatiate KiekerExporter generator
		val pythonExporterGen = new PythonOtelSdkGenerator(records, otelSpan, mappingList)
		val result = pythonExporterGen.generate()
		fsa.generateFile('otkt-gen/otkt/kieker/KiekerExporter.py', result)
        
        var OtelInitGenerator otelInit = new OtelInitGenerator(true)
		// instatiate KiekerProcessor generator, 
		// if we have any attribute that must be pdated either globaly or parently
		if (!(globalyModifiedAttributes.isEmpty && parentlyModifiedAttributes.isEmpty) ||
			!(this.globalModified.isEmpty && this.parentModified.isEmpty)) {

			val pythonProcessorGen = new PythonProcessorSdk(globalyModifiedAttributes, parentlyModifiedAttributes,
				globalModified, parentModified)
			val resultProcessor = pythonProcessorGen.generate()
			fsa.generateFile('otkt-gen/otkt/kieker/KiekerProcessor.py', resultProcessor)
			fsa.generateFile('otkt-gen/otkt/kieker/otelinit.py', otelInit.generate)

		}else{
			otelInit.setGenerateProcessor(false)
			fsa.generateFile('otkt-gen/otkt/kieker/otelinit.py', otelInit.generate)
		}
		
		// generate python module files
		var instrument = new InstrumentGenerator()
		fsa.generateFile('otkt-gen/otkt/tools/instrument.py', instrument.generate)
		var mapping = new JavaMappingGenerator()
		fsa.generateFile('otkt-gen/otkt/tools/javaMapping.py', mapping.generate)
		var setup = new SetupGenerator()
		fsa.generateFile('otkt-gen/setup.py', setup.generate)

		fsa.generateFile('otkt-gen/otkt/__init__.py', "import otkt.kieker\nimport otkt.tools")
		fsa.generateFile('otkt-gen/otkt/kieker/__init__.py', "")
		fsa.generateFile('otkt-gen/otkt/tools/__init__.py', "")

		//generate Makefile
		var makefile = new MakefileGenerator()
		fsa.generateFile('otkt-gen/Makefile', makefile.generate)

		//generate config
		var config = new ConfigGenerator()
		fsa.generateFile('otkt-gen/config.txt', config.generate)		

		// generate custom kieker reciever
		val analysisGen = new AnalysisGenerator(records, resource)
		analysisGen.generate(fsa)
		this.globalModified.clear
		this.parentModified.clear
	}
	
	def  extractGlobalOrParentlyAttributes(KiekerRecord record, EList<mappingModel.Mapping> mappings) {
		val recordName = record.getFqClassName
		//val filteredMappings = mappings.filter[it.getRecordFQClassName.equals(recordName)]
		for (mapping : mappings) {
			if (recordName.equals(mapping.getRecordFQClassName)) {
				for (rule : mapping.getMappingRules) {
					if (rule.getFrom.getAnnotation !== null) {
						if(rule.getFrom.getAnnotation.getDependency.getLiteral.equals("GLOBAL")){
							this.globalModified.add(rule.getFrom)
						}else{
							this.parentModified.add(rule.getFrom)
						}
					}
				}
			}
		}
	}

}

