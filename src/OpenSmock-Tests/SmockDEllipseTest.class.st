"
A SmockDEllipseTest is a test class for testing the behavior of SmockDEllipse
"
Class {
	#name : #SmockDEllipseTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #tests }
SmockDEllipseTest >> testCopy [ 
	
	| dShape dShapeCopy |
	dShape := SmockDEllipse new.
	dShapeCopy := dShape copy.
	
	self assert: dShapeCopy equals: dShape.
	self assert: (dShapeCopy == dShape) equals: false.
]

{ #category : #tests }
SmockDEllipseTest >> testInitialize [ 
	
	| dShape |
	dShape := SmockDEllipse new.
	self deny: dShape isDrawModeDevice.
	self assert: dShape isTranslatedByParent.
	self assert: dShape radius1 equals: nil.
	self assert: dShape radius2 equals: nil.
	self assert: dShape orientation equals: nil.
]
