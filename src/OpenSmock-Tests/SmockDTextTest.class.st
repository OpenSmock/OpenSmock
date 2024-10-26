"
A SmockDTextTest is a test class for testing the behavior of SmockDText
"
Class {
	#name : #SmockDTextTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #tests }
SmockDTextTest >> testCopy [ 
	
	| dShape dShapeCopy |
	dShape := SmockDText new.
	dShapeCopy := dShape copy.
	
	self assert: dShapeCopy equals: dShape.
	self assert: (dShapeCopy == dShape) equals: false.
]

{ #category : #tests }
SmockDTextTest >> testInitialize [ 
	
	| dShape |
	dShape := SmockDText new.
	self assert: dShape isDrawModeDevice.
	self assert: dShape isTranslatedByParent.
	self assert: dShape text equals: nil.
	self assert: dShape smockFont equals: nil.
	self assert: dShape isTranslatedByParent.
]
