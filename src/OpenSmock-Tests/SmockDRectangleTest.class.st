"
A SmockDRectangleTest is a test class for testing the behavior of SmockDRectangle
"
Class {
	#name : #SmockDRectangleTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #tests }
SmockDRectangleTest >> testCopy [ 
	
	| dShape dShapeCopy |
	dShape := SmockDRectangle new.
	dShapeCopy := dShape copy.
	
	self assert: dShapeCopy equals: dShape.
	self assert: (dShapeCopy == dShape) equals: false.
]

{ #category : #tests }
SmockDRectangleTest >> testInitialize [ 
	
	| dShape |
	dShape := SmockDRectangle new.
	self deny: dShape isDrawModeDevice.
	self deny: dShape isTranslatedByParent.
	self assert: dShape length1 equals: nil.
	self assert: dShape length2 equals: nil.
	self assert: dShape orientation equals: nil.
	self deny: dShape isTranslatedByParent.
]
