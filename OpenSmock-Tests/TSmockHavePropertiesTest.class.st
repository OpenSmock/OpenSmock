"
A TSmockHavePropertiesTest is a test class for testing the behavior of TSmockHaveProperties
"
Class {
	#name : #TSmockHavePropertiesTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #tests }
TSmockHavePropertiesTest >> testProperties [ 

	| object |
	object := SmockHavePropertyObjectTest new.
	self assert: object properties isEmpty.
	
	object setProperty: #prop1 value: 1. 
	self assert: (object getProperty: #prop1) equals: 1.
	
	object setProperty: #prop2 value: 'A'.
	self assert: (object getProperty: #prop2) equals: 'A'.
	
	object removeProperty: #prop1. 
	self assert: (object getProperty: #prop1) equals: nil.
	self assert: (object getProperty: #prop2) equals: 'A'.
]
