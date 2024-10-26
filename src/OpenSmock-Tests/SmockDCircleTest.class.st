"
A SmockDCircleTest is a test class for testing the behavior of SmockDCircle
"
Class {
	#name : #SmockDCircleTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #tests }
SmockDCircleTest >> testCopy [ 
	
	| dShape dShapeCopy |
	dShape := SmockDCircle new.
	dShapeCopy := dShape copy.
	
	self assert: dShapeCopy equals: dShape.
	self assert: (dShapeCopy == dShape) equals: false.
]

{ #category : #tests }
SmockDCircleTest >> testInitialize [ 
	
	| dShape |
	dShape := SmockDCircle new.
	self deny: dShape isDrawModeDevice.
	self deny: dShape isTranslatedByParent.
	self assert: dShape radius equals: nil.
	self deny: dShape isTranslatedByParent.
]
