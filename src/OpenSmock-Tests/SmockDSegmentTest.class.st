"
A SmockDSegmentTest is a test class for testing the behavior of SmockDSegment
"
Class {
	#name : #SmockDSegmentTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #tests }
SmockDSegmentTest >> testCopy [ 
	
	| dShape dShapeCopy |
	dShape := SmockDSegment new.
	dShapeCopy := dShape copy.
	
	self assert: dShapeCopy equals: dShape.
	self assert: (dShapeCopy == dShape) equals: false.
]

{ #category : #tests }
SmockDSegmentTest >> testInitialize [ 
	
	| dShape |
	dShape := SmockDSegment new.
	self deny: dShape isDrawModeDevice.
	self deny: dShape isTranslatedByParent.
	self assert: dShape coordinates equals: nil.
	self assert: dShape coordinates2 equals: nil.
	self deny: dShape isTranslatedByParent.
]
