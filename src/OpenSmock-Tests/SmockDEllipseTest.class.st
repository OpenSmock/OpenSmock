"
A SmockDEllipseTest is a test class for testing the behavior of SmockDEllipse
"
Class {
	#name : #SmockDEllipseTest,
	#superclass : #TestCase,
	#instVars : [
		'dShape'
	],
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #running }
SmockDEllipseTest >> setUp [

	super setUp.
	dShape := SmockDEllipse new
]

{ #category : #tests }
SmockDEllipseTest >> testCopy [ 
	
	| dShapeCopy |
	dShapeCopy := dShape copy.
	
	self assert: dShapeCopy equals: dShape.
	self assert: (dShapeCopy == dShape) equals: false.
]

{ #category : #tests }
SmockDEllipseTest >> testInitialize [ 
	
	self deny: dShape isDrawModeDevice.
	self assert: dShape isTranslatedByParent.
	self assert: dShape radius1 equals: nil.
	self assert: dShape radius2 equals: nil.
	self assert: dShape orientation equals: nil.
]
