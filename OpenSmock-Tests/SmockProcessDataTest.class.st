Class {
	#name : #SmockProcessDataTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Model'
}

{ #category : #tests }
SmockProcessDataTest >> testConstructor [

	| processData |
	processData := SmockProcessData processor: nil.

	self assert: processData processor equals: nil
]

{ #category : #tests }
SmockProcessDataTest >> testInitialize [

	| processData |
	processData := SmockProcessData new.

	self assert: processData processor equals: nil.
	self assert: processData properties isEmpty
]

{ #category : #tests }
SmockProcessDataTest >> testProperties [

	| processData |
	processData := SmockProcessData new.
	
	"Test initial"
	self assert: (processData getProperty: #propertyA) equals: nil.
	self assert: (processData getProperty: #propertyB) equals: nil.
	self assert: (processData getProperty: #propertyC) equals: nil.
	
	"Set properties"
	processData setProperty: #propertyA value: 1.
	processData setProperty: #propertyB value: #value.
	processData setProperty: #propertyC value: true.
	
	self assert: processData properties size equals: 3.
	self assert: (processData getProperty: #propertyA) equals: 1.
	self assert: (processData getProperty: #propertyB) equals: #value.
	self assert: (processData getProperty: #propertyC) equals: true.
	self assert: (processData getProperty: #propertyD) equals: nil.
	self assert: (processData isPropertyExists: #propertyA) equals: true.
	self assert: (processData isPropertyExists: #propertyB) equals: true.
	self assert: (processData isPropertyExists: #propertyC) equals: true.
	self assert: (processData isPropertyExists: #propertyD) equals: false.
	
	processData setProperty: #propertyA value: 2.

	self assert: processData properties size equals: 3.
	self assert: (processData getProperty: #propertyA) equals: 2.
	self assert: (processData getProperty: #propertyB) equals: #value.
	self assert: (processData getProperty: #propertyC) equals: true.
	self assert: (processData getProperty: #propertyD) equals: nil.
	self assert: (processData isPropertyExists: #propertyA) equals: true.
	self assert: (processData isPropertyExists: #propertyB) equals: true.
	self assert: (processData isPropertyExists: #propertyC) equals: true.
	self assert: (processData isPropertyExists: #propertyD) equals: false.
	
	processData removeProperty: #propertyB.
	
	self assert: processData properties size equals: 2.
	self assert: (processData getProperty: #propertyA) equals: 2.
	self assert: (processData getProperty: #propertyB) equals: nil.
	self assert: (processData getProperty: #propertyC) equals: true.
	self assert: (processData getProperty: #propertyD) equals: nil.
	self assert: (processData isPropertyExists: #propertyA) equals: true.
	self assert: (processData isPropertyExists: #propertyB) equals: false.
	self assert: (processData isPropertyExists: #propertyC) equals: true.
	self assert: (processData isPropertyExists: #propertyD) equals: false.
]
