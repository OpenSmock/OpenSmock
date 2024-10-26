"
A SmockDLineTest is a test class for testing the behavior of SmockDLine
"
Class {
	#name : #SmockDLineTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #tests }
SmockDLineTest >> testCopy [ 
	
	| dShape dShapeCopy |
	dShape := SmockDLine new.
	dShapeCopy := dShape copy.
	
	self assert: dShapeCopy equals: dShape.
	self assert: (dShapeCopy == dShape) equals: false.
]

{ #category : #tests }
SmockDLineTest >> testInitialize [ 
	
	| dShape |
	dShape := SmockDLine new.
	self deny: dShape isDrawModeDevice.
	self deny: dShape isTranslatedByParent.
	self assert: dShape orientation equals: nil.
	self deny: dShape isTranslatedByParent.
]
