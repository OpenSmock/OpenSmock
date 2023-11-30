"
A TSmockHavePropertiesTest is a test class for testing the behavior of TSmockHaveProperties
"
Class {
	#name : #TSmockHavePropertiesTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #tests }
TSmockHavePropertiesTest >> testGetProperty [

	| object |
	object := SmockHavePropertyObjectTest new.
	
	self assert: (object getProperty: #prop1) equals: nil.
	
	object setProperty: #prop1 value: 1. 
	self assert: (object getProperty: #prop1) equals: 1.
]

{ #category : #tests }
TSmockHavePropertiesTest >> testGetPropertyIfAbsentPut [

	| object |
	object := SmockHavePropertyObjectTest new.
	object getProperty: #prop1 ifAbsentPut: 1.
	self assert: (object getProperty: #prop1) equals: 1.
]

{ #category : #tests }
TSmockHavePropertiesTest >> testInitialize [

	| object |
	object := SmockHavePropertyObjectTest new.
	self assert: object properties isEmpty.
	
]

{ #category : #tests }
TSmockHavePropertiesTest >> testIsPropertiesEmpty [

	| object |
	object := SmockHavePropertyObjectTest new.
	self assert: object isPropertiesEmpty.
	
	object setProperty: #prop1 value: 1. 
	self deny: object isPropertiesEmpty.
	
	object removeProperty: #prop1. 
	self assert: object isPropertiesEmpty.
]

{ #category : #tests }
TSmockHavePropertiesTest >> testIsPropertyExists [

	| object |
	object := SmockHavePropertyObjectTest new.
	
	self deny: (object isPropertyExists: #prop1).
	
	object setProperty: #prop1 value: 1. 
	self assert: (object isPropertyExists: #prop1).
]

{ #category : #tests }
TSmockHavePropertiesTest >> testRemoveProperty [

	| object |
	object := SmockHavePropertyObjectTest new.
	self assert: (object getProperty: #prop1) equals: nil.
	self assert: (object getProperty: #prop2) equals: nil.
	
	object setProperty: #prop1 value: 1. 
	object setProperty: #prop2 value: 'A'.
	
	object removeProperty: #prop1. 
	self assert: (object getProperty: #prop1) equals: nil.
	self assert: (object getProperty: #prop2) equals: 'A'.
	
	object removeProperty: #prop2. 
	self assert: (object getProperty: #prop1) equals: nil.
	self assert: (object getProperty: #prop2) equals: nil.
]

{ #category : #tests }
TSmockHavePropertiesTest >> testSetPropertyValue [

	| object |
	object := SmockHavePropertyObjectTest new.
	self assert: (object getProperty: #prop1) equals: nil.
	self assert: (object getProperty: #prop2) equals: nil.
	
	object setProperty: #prop1 value: 1. 
	self assert: (object getProperty: #prop1) equals: 1.
	self assert: (object getProperty: #prop2) equals: nil.
	
	object setProperty: #prop2 value: 'A'.
	self assert: (object getProperty: #prop1) equals: 1.
	self assert: (object getProperty: #prop2) equals: 'A'
]
