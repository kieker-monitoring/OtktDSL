package kieker.otel.translation.generator.python.module

import kieker.otel.translation.generator.python.IPythonGenerator

class SetupGenerator implements IPythonGenerator{
	override generate() {
		'''
        from setuptools import setup, find_packages

        # Read requirements from requirements.txt
        def read_requirements():
            with open("requirements.txt", "r") as req_file:
                return req_file.read().splitlines()

        setup(
            name="otkt",
            version="1.0.0",
            description="A short description of your project",
            packages=find_packages(),
            install_requires=read_requirements(),
            classifiers=[
                "Programming Language :: Python :: 3",
                "License :: OSI Approved :: MIT License",
                "Operating System :: OS Independent",
            ]
        )
		'''
	}
}
